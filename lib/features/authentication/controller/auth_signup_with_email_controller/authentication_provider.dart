import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/auth_signup_with_email_controller/authentication_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authentication_provider.g.dart';

@riverpod
class AuthenticationProvider extends _$AuthenticationProvider {
  @override
  AuthenticationState build() {
    return AuthenticationState(isLoading: false, authenticated: false);
  }

/// Signs up a user with the provided email, password, name, and confirm password.
///
/// This function performs a series of validations on the input parameters and
/// displays appropriate error messages if any validation fails. If all the
/// validations pass, it calls the `EmailSignupService.signUp` method to create
/// a new user in the Firebase Authentication service. If the user is
/// successfully created, it updates the state to indicate that the user is
/// authenticated.
///
/// Parameters:
/// - email: The email of the user to be created.
/// - password: The password of the user to be created.
/// - name: The name of the user to be created.
/// - confirmPassword: The confirmation password of the user to be created.
///
/// Returns:
/// A Future that completes when the user is successfully created.
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) async {
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        confirmPassword.isEmpty) {
      SnackbarUtil.showsnackbar(message: 'Please fill in all fields');
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      SnackbarUtil.showsnackbar(message: 'Please enter a valid email address');
      return;
    }

    if (name.length < 3) {
      SnackbarUtil.showsnackbar(message: 'Name is too short');
      return;
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      SnackbarUtil.showsnackbar(
          message: "Name should only contain letters and spaces.");
      return;
    }

    if (password != confirmPassword) {
      SnackbarUtil.showsnackbar(message: 'Passwords do not match');
      return;
    }

    if (password.length < 6) {
      SnackbarUtil.showsnackbar(
          message: 'Password must be at least 6 characters');
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await EmailSignupService.signUp(email, password, name);
      state = state.copyWith(authenticated: true, isLoading: false);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false);
      SnackbarUtil.showsnackbar(message: e.code);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
    }

    // state = state.copyWith(isLoading: false, authenticated: true);
  }
}
