import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/auth_textfield_widget.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/features/authentication/controller/auth_signup_with_email_controller/authentication_provider.dart';
import 'package:laundry_bin/features/authentication/view/pages/signin_page.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/main.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends HookConsumerWidget {
  static const String route = '/signup';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authenticationProviderProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final confirmPassword = useTextEditingController();

    useEffect(() {
      return () {
        // Cleanup function to hide the SnackBar when navigating away
        Myapp.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
      };
    }, []);

    return Scaffold(
      backgroundColor:
          state.isLoading ? context.colors.white : context.colors.primary,
      body: state.isLoading
          ? Center(
              child: Lottie.asset(
                Assets.animations.inidicatorAnimated
              ))
          : Stack(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(Assets.images.imgAuthBackground)),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.space.space_300,
                        vertical: context.space.space_250),
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
                            child: Text(context.l10n.registerPageHeading,
                                textAlign: TextAlign.center,
                                style: context.typography.h2
                                    .copyWith(color: context.colors.white))),
                        const Spacer(flex: 3),
                        AppTextField(
                          controller: nameController,
                          hintText: context.l10n.enterName,
                        ),
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
                        AppTextField(
                          controller: confirmPassword,
                          hintText: context.l10n.confirmPassword,
                          obscureText: true,
                        ),
                        SizedBox(height: context.space.space_200),
                        ButtonWhite(
                          onTap: () async {
                            await ref
                                .read(authenticationProviderProvider.notifier)
                                .signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim(),
                                  confirmPassword: confirmPassword.text.trim(),
                                );
                            state.authenticated
                                ? emailController.clear()
                                : null;
                          },
                        ),
                        const Spacer(flex: 2),
                        Center(
                          child: Wrap(children: [
                            Text(
                              context.l10n.alreadyAc,
                              style: context.typography.body
                                  .copyWith(color: context.colors.white),
                            ),
                            SizedBox(width: context.space.space_100),
                            GestureDetector(
                              onTap: () {
                                context.pushReplacement(SigninPage.route);
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
