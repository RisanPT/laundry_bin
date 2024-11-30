import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:laundry_bin/features/offers/view/widgets/offercard_shimmer_widget.dart';
import 'dart:io';

import 'package:laundry_bin/gen/assets.gen.dart';

// Assume the necessary context extensions, imagePickerProvider, and assets are already defined

class OfferImagePickerWidget extends HookConsumerWidget {
  final bool isEdit;
  final OfferModel? offer;
  final File? offerImage;
  const OfferImagePickerWidget({
    super.key,
    required this.isEdit,
    this.offer,
    this.offerImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);

    return InkWell(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) => isPressed.value = false,
      onTapCancel: () => isPressed.value = false,
      onTap: () {
        ref.read(imagePickerProvider.notifier).pickImage();
      },
      child: DottedBorder(
        radius: Radius.circular(context.space.space_100),
        borderType: BorderType.RRect,
        color: context.colors.grey,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.space.space_100),
          child: Container(
            color: isPressed.value
                ? context.colors.grey.withOpacity(0.2)
                : context.colors.white,
            height: context.space.space_500 * 6,
            alignment: Alignment.center,
            child: offerImage != null
                ? Image.file(
                    File(offerImage!.path),
                  )
                : isEdit && offer?.image != null
                    ? ShimmerImage(
                        imageUrl: offer!.image!, height: double.infinity)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.icAddImage, // Placeholder icon
                            height: context.space.space_500,
                            colorFilter: ColorFilter.mode(
                                context.colors.grey, BlendMode.srcIn),
                          ),
                          SizedBox(height: context.space.space_100),
                          Text(
                            context.l10n.addimage,
                            style: context.typography.bodyMedium
                                .copyWith(color: context.colors.grey),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
