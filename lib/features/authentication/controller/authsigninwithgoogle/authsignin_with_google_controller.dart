import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/authsigninwithgoogle/authsignin_with_google_state.dart';
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

//   Future<void> signInWithGoogle() async {
//     try {
//       EmailSignupService.signinwithGoogle();
//     } on FirebaseAuthException catch (e) {
//       SnackbarUtil.showsnackbar(message: e.toString());
//     } catch (e) {
//       SnackbarUtil.showsnackbar(message: e.toString());
//     }
//   }
// }
  Future<void> signInWithGoogleWrapper() async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true);
      await EmailSignupService.signInWithGoogle();
      // Set authenticated state if sign-in is successful
      state = state.copyWith(authenticated: true);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: e.toString());
    } finally {
      // Reset loading state
      state = state.copyWith(isLoading: false);
    }
  }
}
