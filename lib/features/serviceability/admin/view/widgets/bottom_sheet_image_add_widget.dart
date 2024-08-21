import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';

class AddClothBottomSheetContentWidget extends HookConsumerWidget {
  const AddClothBottomSheetContentWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final TextEditingController clothNameController = TextEditingController();
    Future<void> addClothBtnCallback() async {}

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: context.space.space_200,
          left: context.space.space_200,
          right: context.space.space_200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.addCloths,
              style: context.typography.h3
                  .copyWith(color: context.colors.primaryTxt),
            ),
            Center(
              child: ImagePickerForServices(
                onTap: () {
                  ref.read(imagePickerProvider.notifier).pickImage();
                },
              ),
            ),
            Text(
              context.l10n.instructionsTitle,
              style: context.typography.bodyLargeSemiBold
                  .copyWith(color: context.colors.primaryTxt),
            ),
            SizedBox(
              height: context.space.space_100,
            ),
            TextField(
              controller: clothNameController,
              decoration: InputDecoration(
                  hintText: context.l10n.textfieldTitle,
                  hintStyle: context.typography.bodyMedium
                      .copyWith(color: context.colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: context.colors.primary,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: context.colors.primary,
                  ))),
            ),
            SizedBox(
              height: context.space.space_150,
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                label: context.l10n.save,
                onTap: addClothBtnCallback,
              ),
            ),
            SizedBox(
              height: context.space.space_100,
            )
          ],
        ),
      ),
    );
  }
}
