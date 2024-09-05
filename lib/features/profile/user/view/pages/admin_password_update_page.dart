import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/authentication/controller/update_password_controller/update_password_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';

class UpdatePasswordScreen extends HookConsumerWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();

    return SingleChildScrollView(
      
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
        child: Column(
          children: [
             SizedBox(height: context.space.space_200),
            const SectionTitleWidget(title: "Enter Your Old Password",),
             SizedBox(height: context.space.space_200),
            TextFieldWidget(
              controller: currentPasswordController,
              labelText: 'Current Password',
              obscureText: true,
              hintText: "Enter your current password",
            ),
             SizedBox(height: context.space.space_200),
            const SectionTitleWidget(title: "Enter Your New Password",),
             SizedBox(height: context.space.space_200),
            TextFieldWidget(
              controller: newPasswordController,
              labelText: 'New Password',
              obscureText: false,
              hintText: "Enter your new password",
            ),
             SizedBox(height: context.space.space_200),
            ButtonWidget(
              onTap: () async {
                try {
                  await ref
                      .read(updatePasswordControllerProvider.notifier)
                      .updatePasswordAll(
                        currentPasswordController.text,
                        newPasswordController.text,
                      );
                  SnackbarUtil.showsnackbar(
                    message: "Password updated successfully",
                  );
                } catch (e) {
                  SnackbarUtil.showsnackbar(message: "Password update failed");
                }
                Navigator.pop(context);
              },
              label: 'Update Password',
            ),
             SizedBox(height: context.space.space_200),
          ],
        ),
      ),
    );
  }
}
