import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/auth_textfield_widget.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/features/authentication/controller/auth_reset_password_controller/auth_reset_password_controller.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ForgotPassword extends HookConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authResetPasswordControllerProvider);
    final emailController = useTextEditingController();
    useEffect(() {
      if (state.success) {
        emailController.clear();
      }
      return null;
    }, [state.success]);
    return Scaffold(
      backgroundColor:
          state.isLoading ? context.colors.white : context.colors.primary,
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: context.colors.primary,
            ))
          : Stack(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(Assets.images.imgAuthBackground)),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(context.space.space_300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  Assets.icons.icArrowLeftWhite),
                              onPressed: () {
                                context.pop();
                              },
                            )),
                        const Spacer(flex: 2),
                        Center(
                            child: Text(context.l10n.forgotPasswordHeading,
                                textAlign: TextAlign.center,
                                style: context.typography.h2
                                    .copyWith(color: context.colors.white))),
                        SizedBox(
                          height: context.space.space_200,
                        ),
                        Center(
                          child: Text(
                            context.l10n.forgotPasswordSubTitle,
                            style: context.typography.body
                                .copyWith(color: context.colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(flex: 3),
                        AppTextField(
                          hintText: context.l10n.enteremailid,
                          controller: emailController,
                        ),
                        SizedBox(height: context.space.space_200),
                        ButtonWhite(
                          name: context.l10n.next,
                          onTap: () {
                            ref
                                .read(authResetPasswordControllerProvider
                                    .notifier)
                                .resetPassword(emailController.text);
                          },
                        ),
                        const Spacer(flex: 2),
                        Center(
                          child: Wrap(children: [
                            Text(
                              context.l10n.rememberPassword,
                              style: context.typography.body
                                  .copyWith(color: context.colors.white),
                            ),
                            SizedBox(width: context.space.space_100),
                            GestureDetector(
                              onTap: () {
                                context.pushReplacement('/signin');
                              },
                              child: Text(
                                context.l10n.login,
                                style: TextStyle(
                                    color: context.colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: context.colors.white),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
