import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ImagePickerForServices extends ConsumerWidget {
  const ImagePickerForServices({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> imagepick(BuildContext context) async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        ref.read(imageProvider.notifier).state = pickedFile;
      }
    }

    return GestureDetector(
      onTap: () {
        // ImagePickerUtils.showDialogueForImagePicker(context);
        imagepick(context);
      },
      child: DottedBorder(
          radius: Radius.circular(context.space.space_500 * 5),
          borderType: BorderType.RRect,
          color: context.colors.grey,
          child: Container(
              height: context.space.space_500 * 5,
              width: context.space.space_500 * 5,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icAddImage,
                    height: context.space.space_500,
                    colorFilter:
                        ColorFilter.mode(context.colors.grey, BlendMode.srcIn),
                  ),
                  SizedBox(height: context.space.space_100),
                  Text(
                    "Add Image",
                    style: context.typography.bodyMedium
                        .copyWith(color: context.colors.grey),
                  )
                ],
              ))),
    );
  }
}

final imageProvider = StateProvider<XFile?>((ref) => null);
