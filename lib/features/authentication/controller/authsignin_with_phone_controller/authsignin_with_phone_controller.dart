import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/authsignin_with_phone_controller/authsigninstate_with_phone.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authsignin_with_phone_controller.g.dart';

@riverpod
class AuthsigninWithPhoneController extends _$AuthsigninWithPhoneController {
  @override
  AuthSigninStateWithphone build() {
    return AuthSigninStateWithphone(
      isLoading: false,
      authenticated: false,
    );
  }

  Future<String?> signInWithPhone(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      SnackbarUtil.showsnackbar(message: 'Please enter a valid phone number');
      return null;
    }
    if (phoneNumber.length < 13) {
      SnackbarUtil.showsnackbar(message: 'Please enter a valid phone number');
      return null;
    }

    try {
      state = state.copyWith(isLoading: true);
      final verificationid =
          await EmailSignupService.sendOTP(phoneNumber: phoneNumber);
      state = state.copyWith(isLoading: false, authenticated: true);
      return verificationid;
    } on Exception catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      return null;
    }
  }

  Future<void> verifyOtp(String verificationId, String otp) async {
    try {
      await EmailSignupService.verifyOtp(verificationId, otp);
      state = state.copyWith(authenticated: true);
    } on Exception catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
    }
  }
}

final coutryCodeProvider = StateProvider<String>(
  (ref) => '+91',
);
