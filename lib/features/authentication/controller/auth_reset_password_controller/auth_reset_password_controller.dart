import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/auth_reset_password_controller/auth_reset_password_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_reset_password_controller.g.dart';

@riverpod
class AuthResetPasswordController extends _$AuthResetPasswordController {
  @override
  AuthResetPasswordState build() {
    return const AuthResetPasswordState();
  }

    /// Resets the password for a user with the given email.
    ///
    /// This function first checks if the email is empty. If it is, it displays a
    /// snackbar message asking the user to enter an email. If the email is not
    /// empty, it checks if it is a valid email address using a regular expression.
    /// If the email is not valid, it displays a snackbar message asking the user
    /// to enter a valid email.
    ///
    /// If the email is valid, it sets the state to indicate that it is loading.
    /// It then calls the `EmailSignupService.resetPassword` method to send a
    /// password reset email to the user. After a delay of 2 seconds, it updates
    /// the state to indicate that the password reset email has been sent. It
    /// also displays a snackbar message indicating that the email has been sent.
    ///
    /// If a `FirebaseAuthException` is caught, it displays a snackbar message
    /// with the error code. If any other exception is caught, it displays a
    /// snackbar message with the exception's message.
    ///
    /// Parameters:
    /// - email: The email of the user whose password is being reset.
    ///
    /// Returns:
    /// A `Future` that completes when the password reset process is complete.
  Future<void> resetPassword(String email) async {
    if (email.isEmpty) {
      SnackbarUtil.showsnackbar(message: 'Please enter email');
      return;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      SnackbarUtil.showsnackbar(message: 'Please enter valid email');
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await EmailSignupService.resetPassword(email);
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isLoading: false, success: true);
      SnackbarUtil.showsnackbar(message: 'Password reset email sent');
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
    }
  }
}
