import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/core/widgets/phonenumber_textfield_widget.dart';
import 'package:laundry_bin/features/authentication/controller/authsignin_with_phone_controller/authsignin_with_phone_controller.dart';
import 'package:laundry_bin/features/authentication/view/pages/signin_page.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class PhoneLoginPage extends HookConsumerWidget {
  static const String route = '/phone_login_page';
  const PhoneLoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phonecontroller = useTextEditingController();
    final loader = ref.watch(authsigninWithPhoneControllerProvider);
    return Scaffold(
      backgroundColor:
          loader.isLoading ? context.colors.white : context.colors.primary,
      body: loader.isLoading
          ? Center(
              child: Lottie.asset(
              Assets.animations.inidicatorAnimated,
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
                            child: Text(context.l10n.registerPageHeading,
                                textAlign: TextAlign.center,
                                style: context.typography.h2
                                    .copyWith(color: context.colors.white))),
                        const Spacer(flex: 3),
                        SizedBox(height: context.space.space_200),
                        Phonenumbertextfield(
                          controller: phonecontroller,
                          onChanged: (value) {
                            ref.read(coutryCodeProvider.notifier).state = value;
                            log(value);
                          },
                        ),
                        ButtonWhite(
                          name: context.l10n.continueFor,
                          onTap: () async {
                            final verificationid = await ref
                                .read(authsigninWithPhoneControllerProvider
                                    .notifier)
                                .signInWithPhone(
                                    "${ref.read(coutryCodeProvider)}${phonecontroller.text}");
                            if (verificationid != null) {
                              if (context.mounted) {
                                context.push('/otpverification',
                                    extra: verificationid);
                              }
                            }
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
