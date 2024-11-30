import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/auth_logout_controller/auth_logout_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_logout_controller.g.dart';

@riverpod
class AuthLogoutController extends _$AuthLogoutController {
  @override
  AuthLogoutState build() {
    return const AuthLogoutState(isLoading: false, authenticated: false);
  }

  /// Logs out the user from the application.
  ///
  /// This function attempts to sign out the user from the application.
  /// It sets the `isLoading` state to `true` and waits for a delay of
  /// 2 seconds. Then, it calls the `signOut` method of the
  /// `EmailSignupService` class.
  ///
  /// If the sign-out is successful, the `isLoading` state is set to `false`
  /// and the `authenticated` state is set to `false`.
  ///
  /// If an exception of type `FirebaseAuthException` is caught, the error
  /// code is displayed in a snackbar and the `isLoading` state is set to
  /// `false`.
  ///
  /// If any other exception is caught, the error is displayed in a
  /// snackbar and the `isLoading` state is set to `false`.
  ///
  /// Returns a `Future` that completes when the sign-out is complete.
  Future<void> logout() async {
    try {
      state = state.copyWith(isLoading: true);
      await Future.delayed(const Duration(seconds: 2));
      await EmailSignupService.signOut();

      state = state.copyWith(isLoading: false, authenticated: false);
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
    }
  }
}
