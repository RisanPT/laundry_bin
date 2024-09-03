import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/auth_signin_with_google/authsignin_with_google_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authsignin_with_google_controller.g.dart';

@riverpod
class AuthsigninWithGoogleController extends _$AuthsigninWithGoogleController {
  @override
  AuthSigninWithGoogleState build() {
    return const AuthSigninWithGoogleState(
      isLoading: false,
      authenticated: false,
    );
  }

  /// Signs in the user with Google.
  ///
  /// This function sets the loading state to true, calls the `signInWithGoogle` function from the `EmailSignupService` class, and sets the authenticated state to true if the sign-in is successful. If an exception occurs during the sign-in process, a snackbar is displayed with the error message. Finally, the loading state is set to false.
  ///
  /// Returns:
  /// - `Future<void>`: A future that completes when the sign-in process is finished.
  Future<void> signInWithGoogleWrapper() async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true);
      await EmailSignupService.signInWithGoogle();
      // Set authenticated state if sign-in is successful
      state = state.copyWith(isLoading: false, authenticated: true);

      
      
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
