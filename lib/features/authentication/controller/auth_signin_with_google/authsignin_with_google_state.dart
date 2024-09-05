import 'package:freezed_annotation/freezed_annotation.dart';
part 'authsignin_with_google_state.freezed.dart';
part 'authsignin_with_google_state.g.dart';

@freezed
class AuthSigninWithGoogleState with _$AuthSigninWithGoogleState {
  const factory AuthSigninWithGoogleState({
    required bool isLoading,
    required bool authenticated,
    

  }) = _AuthSigninWithGoogleState;
  factory AuthSigninWithGoogleState.fromJson(Map<String, dynamic> json) =>
      _$AuthSigninWithGoogleStateFromJson(json);
}
