import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/core/widgets/thirdpartylogin_button_widget.dart';
import 'package:laundry_bin/features/authentication/controller/authsigninwithgoogle/authsignin_with_google_controller.dart';
import 'package:laundry_bin/features/authentication/view/pages/phone_loginpage.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class FirstPageAfterSplash extends ConsumerWidget {
  static const String route = '/first_page_after_splash';
  const FirstPageAfterSplash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authsigninWithGoogleControllerProvider);
    return Scaffold(
      backgroundColor:
          state.isLoading ? context.colors.white : context.colors.primary,
      body: state.isLoading
          ? Center( 
              child: Container(
                  padding: EdgeInsets.all(context.space.space_300),
                  child: Lottie.asset(Assets.animations.inidicatorAnimated,
                      height: 100, width: 100)),
            )
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
                        const Spacer(flex: 1),
                        Center(
                            child: SvgPicture.asset(
                                Assets.images.icLaundryIcLogoCombined)),
                        SizedBox(
                          height: context.space.space_200,
                        ),
                        SizedBox(height: context.space.space_500),
                        const Spacer(flex: 2),
                        ButtonWhite(
                          name: context.l10n.register,
                          color: context.colors.primary,
                          hintTextcolor: context.colors.white,
                          onTap: () {
                            context.push('/signup');
                          },
                        ),
                        SizedBox(height: context.space.space_200),
                        ThirdpartyloginButton(
                          prefixIcon:
                              SvgPicture.asset(Assets.icons.icCellphoneWhite),
                          color: context.colors.primary,
                          name: context.l10n.withphone,
                          hintTextcolor: context.colors.white,
                          onTap: () {
                            context.push(PhoneLoginPage.route);
                          },
                        ),
                        SizedBox(height: context.space.space_200),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            return ThirdpartyloginButton(
                              onTap: () async {
                                ref
                                    .read(authsigninWithGoogleControllerProvider
                                        .notifier)
                                    .signInWithGoogleWrapper();
                              },
                              prefixIcon:
                                  SvgPicture.asset(Assets.icons.icGoogleWhite),
                              color: context.colors.primary,
                              name: context.l10n.withgoogle,
                              hintTextcolor: context.colors.white,
                            );
                          },
                        ),
                        SizedBox(height: context.space.space_200),
                        ButtonWhite(
                          name: context.l10n.login,
                          color: context.colors.primary,
                          hintTextcolor: context.colors.white,
                          onTap: () {
                            context.push('/signin');
                          },
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
