import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/authsignin_controller/auth_signin_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_sign_in_controller.g.dart';

@riverpod
class AuthSignInProvider extends _$AuthSignInProvider {
  @override

  /// Builds an instance of [AuthSigninState] with `isLoading` set to `false` and `authenticated` set to `false`.
  ///
  /// Returns:
  ///   An instance of [AuthSigninState] with `isLoading` set to `false` and `authenticated` set to `false`.
  AuthSigninState build() {
    return AuthSigninState(isLoading: false, authenticated: false);
  }

  /// Signs in a user with the provided email and password.
  ///
  /// This function validates the email and password, sets the loading state to true,
  /// and attempts to sign in the user using the provided email and password.
  /// If the sign-in is successful, the loading state is set to false and the authenticated state is set to true.
  /// If an exception of type `FirebaseAuthException` is caught, the error code is displayed in a snackbar and the loading state is set to false.
  /// If any other exception is caught, the error is displayed in a snackbar and the loading state is set to false.
  ///
  /// Parameters:
  /// - email: The email of the user to be signed in.
  /// - password: The password of the user to be signed in.
  ///
  /// Returns:
  /// - `Future<void>`: A future that completes when the sign-in process is complete.
  Future<void> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      SnackbarUtil.showsnackbar(message: 'Please fill in all fields');
      return;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      SnackbarUtil.showsnackbar(message: 'Please enter a valid email address');
      return;
    }
    try {
      state = state.copyWith(isLoading: true);
      await EmailSignupService.signIn(email, password);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        EmailSignupService.signOut();
        SnackbarUtil.showsnackbar(message: 'Please verify your email address');
        state = state.copyWith(isLoading: false, authenticated: false);
        return;
      }
      state = state.copyWith(isLoading: false, authenticated: true);
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> isAdmin() async {
    try {
      return await EmailSignupService.isAdmin();
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
      return false;
    }
  }
}
