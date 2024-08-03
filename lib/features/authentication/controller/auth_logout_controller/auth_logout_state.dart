import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_logout_state.g.dart';
part 'auth_logout_state.freezed.dart';

@freezed
class AuthLogoutState with _$AuthLogoutState {
  const factory AuthLogoutState({
    @Default(false) bool isLoading,
    @Default(false) bool authenticated,
  }) = _AuthLogoutState;
  factory AuthLogoutState.fromJson(Map<String, dynamic> json) =>
      _$AuthLogoutStateFromJson(json);
}
