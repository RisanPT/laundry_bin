import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication_state.freezed.dart';
part 'authentication_state.g.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState(
      {required bool isLoading,
      required bool authenticated}) = _AuthenticationState;
  factory AuthenticationState.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationStateFromJson(json);
}
