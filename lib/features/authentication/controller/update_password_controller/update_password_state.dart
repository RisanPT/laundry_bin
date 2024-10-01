

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_state.freezed.dart';
part 'update_password_state.g.dart';

@freezed
class UpdatePasswordState with _$UpdatePasswordState {
  factory UpdatePasswordState(
      {required bool isLoading,
      required bool success}) = _UpdatePasswordState;
  factory UpdatePasswordState.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordStateFromJson(json);
}