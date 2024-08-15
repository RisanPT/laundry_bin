import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_reset_password_state.g.dart';
part 'auth_reset_password_state.freezed.dart';

@freezed
class AuthResetPasswordState with _$AuthResetPasswordState {
  const factory AuthResetPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
  }) = _AuthResetPasswordState;

  factory AuthResetPasswordState.fromJson(Map<String, dynamic> json) =>
      _$AuthResetPasswordStateFromJson(json);
}
