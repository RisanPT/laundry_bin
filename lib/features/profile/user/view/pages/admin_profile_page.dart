import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';
import 'package:laundry_bin/features/authentication/controller/auth_logout_controller/auth_logout_controller.dart';
import 'package:laundry_bin/features/profile/user/view/pages/admin_password_update_page.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AdminProfilePage extends ConsumerWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imagePickerProvider);
    final state = ref.watch(authLogoutControllerProvider);
    return Scaffold(
      body: state.isLoading
          ? const LoadingIndicator()
          : Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.space.space_200),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    Text(
                      " Profile ",
                      style: context.typography.h2
                          .copyWith(color: context.colors.btnShadow),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: ref.read(imagePickerProvider.notifier).pickImage,
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
                                  ? Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.icAddImage,
                                          height: context.space.space_500,
                                          colorFilter: ColorFilter.mode(
                                              context.colors.grey,
                                              BlendMode.srcIn),
                                        ),
                                        SizedBox(
                                            height: context.space.space_100),
                                        Text(
                                          context.l10n.addimage,
                                          style: context.typography.bodyMedium
                                              .copyWith(
                                                  color: context.colors.grey),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {},
                        child: Row(children: [
                          Icon(
                            Icons.edit,
                            size: context.space.space_300,
                            color: context.colors.btnShadow,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.space.space_200),
                            child: Text(
                              "Edit Profile",
                              style: context.typography.bodyLargeMedium
                                  .copyWith(color: context.colors.btnShadow),
                            ),
                          ),
                        ])),
                    TextButton(
                        onPressed: () {
                         showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) => const UpdatePasswordScreen()
        );
                        },
                        child: Row(children: [
                          Icon(
                            Icons.password_outlined,
                            size: context.space.space_300,
                            color: context.colors.btnShadow,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.space.space_200),
                            child: Text(
                              "Change Password",
                              style: context.typography.bodyLargeMedium
                                  .copyWith(color: context.colors.btnShadow),
                            ),
                          ),
                        ])),
                    TextButton(
                        onPressed: () async {
                          await ref
                              .read(authLogoutControllerProvider.notifier)
                              .logout();
                        },
                        child: Row(children: [
                          Icon(
                            Icons.logout_outlined,
                            size: context.space.space_300,
                            color: context.colors.btnShadow,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.space.space_200),
                            child: Text(
                              "Log Out",
                              style: context.typography.bodyLargeMedium
                                  .copyWith(color: context.colors.btnShadow),
                            ),
                          ),
                        ]))
                  ],
                ),
              ),
            ),
    );
  }
}
