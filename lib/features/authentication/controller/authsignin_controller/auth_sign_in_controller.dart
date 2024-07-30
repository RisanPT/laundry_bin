import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/authsignin_controller/auth_signin_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_sign_in_controller.g.dart';

@riverpod
class AuthSignInProvider extends _$AuthSignInProvider {
  @override
  AuthSigninState build() {
    return AuthSigninState(isLoading: false, authenticated: false);
  }

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
      state = state.copyWith(isLoading: false, authenticated: true);
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
      state = state.copyWith(isLoading: false);
    }catch(e){
      SnackbarUtil.showsnackbar(message: e.toString());
      state = state.copyWith(isLoading: false);
    }
    // state = state.copyWith(isLoading: false, authenticated: true);
  }
}
