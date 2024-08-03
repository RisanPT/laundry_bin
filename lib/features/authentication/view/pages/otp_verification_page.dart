import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/features/authentication/controller/authsignin_with_phone_controller/authsignin_with_phone_controller.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpVerificationPage extends HookConsumerWidget {
  final String verificationid;
  const OtpVerificationPage({
    required this.verificationid,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = OtpFieldController();
    final state = ref.watch(authsigninWithPhoneControllerProvider);
    ref.listen(authsigninWithPhoneControllerProvider, (previous, next) {
      if (previous?.phonenumber != next.phonenumber) {
        log("Phone number updated: ${next.phonenumber}");
      }
    });

    final otpCode = useState('');
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
                          const Spacer(flex: 1),
                          Center(
                            child: Text(
                              context.l10n.otpVerificationHeading,
                              style: context.typography.h2
                                  .copyWith(color: context.colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: context.space.space_400),
                          Center(
                            child: Text(
                              context.l10n.otpVerificationSubTitle,
                              style: context.typography.body
                                  .copyWith(color: context.colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: context.space.space_700),
                          OTPTextField(
                            otpFieldStyle: OtpFieldStyle(
                              disabledBorderColor: context.colors.white,
                              backgroundColor: context.colors.white,
                              borderColor: context.colors.white,
                              enabledBorderColor: context.colors.white,
                              focusBorderColor: context.colors.white,
                            ),
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: 50,
                            style: TextStyle(fontSize: 17),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                            },
                            onChanged: (value) {
                              otpCode.value = value;
                              print(otpCode.value);
                            },
                            length: 6,
                            controller: otpController,
                          ),
                          SizedBox(
                            height: context.space.space_500,
                          ),
                          ButtonWhite(
                            name: context.l10n.verify,
                            onTap: () async {
                              print(otpCode.value);
                              print(verificationid);
                              await ref
                                  .read(authsigninWithPhoneControllerProvider
                                      .notifier)
                                  .verifyOtp(verificationid, otpCode.value);
                            },
                          ),
                          SizedBox(height: context.space.space_200),
                          Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Text(
                                  context.l10n.dontReceiveOtp,
                                  style: context.typography.body
                                      .copyWith(color: context.colors.white),
                                ),
                                SizedBox(
                                  width: context.space.space_50,
                                ),
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(
                                            authsigninWithPhoneControllerProvider
                                                .notifier)
                                        .resendOtp();
                                  },
                                  child: Text(
                                    context.l10n.resendOtp,
                                    style: context.typography.body
                                        .copyWith(color: context.colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(flex: 3),
                        ]),
                  ),
                ),
              ],
            ),
    );
  }
}
