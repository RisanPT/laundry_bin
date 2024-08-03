import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/apptextfield.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/features/authentication/controller/authsignin_controller/auth_sign_in_controller.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class SigninPage extends HookConsumerWidget {
  const SigninPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authSignInProviderProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ref.listen(authSignInProviderProvider, (previous, next) {
      if (!next.isLoading) {
        if (next.authenticated) {
          emailController.clear();
          passwordController.clear();
        }
      }
    });
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
                            child: Text(context.l10n.loginPageHeading,
                                textAlign: TextAlign.center,
                                style: context.typography.h2
                                    .copyWith(color: context.colors.white))),
                        const Spacer(flex: 3),
                        SizedBox(height: context.space.space_200),
                        AppTextField(
                          controller: emailController,
                          hintText: context.l10n.enteremailid,
                        ),
                        SizedBox(height: context.space.space_200),
                        AppTextField(
                          controller: passwordController,
                          hintText: context.l10n.enterPassword,
                          obscureText: true,
                        ),
                        SizedBox(height: context.space.space_200),
                        ButtonWhite(
                          name: context.l10n.login,
                          onTap: () async {
                            await ref
                                .read(authSignInProviderProvider.notifier)
                                .signIn(emailController.text,
                                    passwordController.text);
                          },
                        ),
                        SizedBox(height: context.space.space_200),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              context.push('/forgot_password');
                            },
                            child: Text(
                              context.l10n.forgotPassword,
                              style: context.typography.body
                                  .copyWith(color: context.colors.white),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                        Center(
                          child: Wrap(children: [
                            Text(
                              context.l10n.dontHaveAc,
                              style: context.typography.body
                                  .copyWith(color: context.colors.white),
                            ),
                            SizedBox(width: context.space.space_100),
                            GestureDetector(
                              onTap: () {
                                context.push('/signup');
                              },
                              child: Text(
                                context.l10n.registerNow,
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
