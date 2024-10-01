
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/authentication/controller/update_password_controller/update_password_state.dart';
import 'package:laundry_bin/features/authentication/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_password_controller.g.dart';

@riverpod
class UpdatePasswordController extends _$UpdatePasswordController {
@override
  UpdatePasswordState build(){
    return UpdatePasswordState(isLoading: false, success: false);
  }

 Future<void> updatePasswordAll(String currentPassword, String newPassword) async {
  state = state.copyWith(isLoading: true, success: false);

  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await EmailSignupService.updatePassword(currentPassword, newPassword);
      state = state.copyWith(success: true);
    } else {
      state = state.copyWith(isLoading: false);
    }
  } on FirebaseAuthException catch (e) {
    state = state.copyWith(isLoading: false, success: false);
    SnackbarUtil.showsnackbar(message: e.code);
  } catch (e) {
    SnackbarUtil.showsnackbar(message: 'Error: $e');
    state = state.copyWith(isLoading: false);
  } finally {
    state = state.copyWith(isLoading: false);
  }
}
  }
