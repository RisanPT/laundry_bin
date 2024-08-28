import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/controller/svg_pick.controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ImagePickerForServices extends HookConsumerWidget {
  final VoidCallback onTap;
  final File? initialImage; // Add this line to accept the initial image

  const ImagePickerForServices(
      {super.key,
      required this.onTap,
      this.initialImage}); // Update constructor

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imagePickerProvider) ??
        initialImage; // Use initialImage if no new image is selected

    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        radius: Radius.circular(context.space.space_500 * 5),
        borderType: BorderType.RRect,
        color: context.colors.grey,
        child: Container(
          height: context.space.space_500 * 4,
          width: context.space.space_500 * 4,
          alignment: Alignment.center,
          child: ClipOval(
            child: SizedBox(
              width: context.space.space_500 * 5.4,
              height: context.space.space_500 * 5.4,
              child: image != null
                  ? Image.file(image) // Display the initial or selected image
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.icAddImage,
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
      ),
    );
  }
}
