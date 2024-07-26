import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/utils/image_picker_utils.dart';

class ImageSelctionWidget extends StatelessWidget {
  const ImageSelctionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        ImagePickerUtils.showDialogueForImagePicker(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.space.space_600,
            horizontal: context.space.space_900),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.image,
              color: context.colors.white,
            )),
      ),
    ));
  }
}
