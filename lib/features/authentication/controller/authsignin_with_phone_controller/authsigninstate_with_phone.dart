import 'package:freezed_annotation/freezed_annotation.dart';
part 'authsigninstate_with_phone.freezed.dart';
part 'authsigninstate_with_phone.g.dart';

@freezed
class AuthSigninStateWithphone with _$AuthSigninStateWithphone {
  factory AuthSigninStateWithphone(
      {required bool isLoading,
      required bool authenticated,
      String? phonenumber
     }) = _AuthSigninStateWithphone;

  factory AuthSigninStateWithphone.fromJson(Map<String, dynamic> json) =>
      _$AuthSigninStateWithphoneFromJson(json);
}
