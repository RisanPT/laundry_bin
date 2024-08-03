import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_signin_state.freezed.dart';
part 'auth_signin_state.g.dart';

@freezed
class AuthSigninState with _$AuthSigninState {
  factory AuthSigninState(
      {required bool isLoading,
      required bool authenticated}) = _AuthSigninState;

  factory AuthSigninState.fromJson(Map<String, dynamic> json) =>
      _$AuthSigninStateFromJson(json);
}
