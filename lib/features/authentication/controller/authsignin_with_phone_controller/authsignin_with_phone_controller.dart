import 'package:firebase_auth/firebase_auth.dart';
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

  /// Signs in a user with the provided phone number.
  ///
  /// This function takes a [phoneNumber] as input and attempts to sign in the user
  /// with that phone number. It first checks if the provided phone number is valid
  /// by checking its length. If the length is less than 13, it displays a snackbar
  /// message asking the user to enter a valid phone number and returns `null`.
  ///
  /// If the phone number is valid, it sets the `isLoading` state to `true` and
  /// calls the `sendOTP` function from the `EmailSignupService` class to send an
  /// OTP (One-Time Password) to the provided phone number. The function then waits
  /// for the OTP to be sent and returns the verification ID.
  ///
  /// If the sign-in process is successful, it sets the `isLoading` state to `false`
  /// and the `authenticated` state to `true`.
  ///
  /// If a `FirebaseAuthException` is caught during the sign-in process, it displays
  /// the error code in a snackbar and sets the `isLoading` state to `false`.
  ///
  /// If any other exception is caught, it displays the error in a snackbar and
  /// sets the `isLoading` state to `false`.
  ///
  /// Returns a `Future` that completes with the verification ID if the sign-in is
  /// successful, or `null` if the phone number is invalid or if an error occurs.
  Future<String?> signInWithPhone(String phoneNumber) async {
    if (phoneNumber.length < 13) {
      SnackbarUtil.showsnackbar(message: 'Please enter a valid phone number');
      return null;
    }
    try {
      state = state.copyWith(isLoading: true, phonenumber: phoneNumber);
      
      final verificationid =
          await EmailSignupService.sendOTP(phoneNumber: phoneNumber);
      state = state.copyWith(isLoading: false, authenticated: true);
      return verificationid;
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
      return null;
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
      return null;
    }
  }

  /// Verifies the OTP (One-Time Password) using the provided verification ID and OTP.
  ///
  /// This function updates the state of the controller to show loading while the OTP is being verified.
  /// It then calls the `verifyOtp` method of the `EmailSignupService` class with the provided `verificationId` and `otp`.
  /// If the OTP verification is successful, the state is updated to show that the user is authenticated and the loading state is set to false.
  ///
  /// If a `FirebaseAuthException` is caught during the verification process, the error code is displayed in a snackbar and the loading state is set to false.
  ///
  /// If any other exception is caught, the error is displayed in a snackbar and the loading state is set to false.
  ///
  /// Parameters:
  /// - `verificationId`: The verification ID received from the phone number verification process.
  /// - `otp`: The OTP (One-Time Password) entered by the user.
  ///
  /// Returns:
  /// - `Future<void>`: A future that completes when the OTP verification is completed.
  Future<void> verifyOtp(String verificationId, String otp) async {
    try {
      state = state.copyWith(isLoading: true);
      await EmailSignupService.verifyOtp(verificationId, otp);
      state = state.copyWith(authenticated: true, isLoading: false);
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
    } on Exception catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
    }
  }

  /// Resends an OTP (One-Time Password) to the provided phone number and returns the verification ID.
  ///
  /// This function checks if the phone number is available in the state. If it is not available, it displays
  /// a snackbar message and returns null. If the phone number is available, it sets the `isLoading` state to
  /// true, calls the `sendOTP` method of the `EmailSignupService` class with the provided phone number, and
  /// returns the verification ID. If a `FirebaseAuthException` is caught during the process, it displays the
  /// error code in a snackbar and sets the `isLoading` state to false. If any other exception is caught, it
  /// displays the error in a snackbar and sets the `isLoading` state to false.
  ///
  /// Parameters:
  /// - None
  ///
  /// Returns:
  /// - A `Future` that completes with the verification ID if the OTP is sent successfully, or null if the
  ///   phone number is not available or if an error occurs.
  Future<String?> resendOtp() async {
    final phoneNumber = state.phonenumber;
    if (phoneNumber == null) {
      SnackbarUtil.showsnackbar(message: 'Phone number not available');
      return null;
    }
    try {
      state = state.copyWith(isLoading: true);
      final verificationid =
          await EmailSignupService.sendOTP(phoneNumber: phoneNumber);
      state = state.copyWith(isLoading: false);
      return verificationid;
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
      return null;
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
      return null;
    }
  }
}

final coutryCodeProvider = StateProvider<String>(
  (ref) => '+91',
);
