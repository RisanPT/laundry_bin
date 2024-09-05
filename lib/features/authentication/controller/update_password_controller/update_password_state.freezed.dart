// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdatePasswordState _$UpdatePasswordStateFromJson(Map<String, dynamic> json) {
  return _UpdatePasswordState.fromJson(json);
}

/// @nodoc
mixin _$UpdatePasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this UpdatePasswordState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePasswordStateCopyWith<UpdatePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordStateCopyWith<$Res> {
  factory $UpdatePasswordStateCopyWith(
          UpdatePasswordState value, $Res Function(UpdatePasswordState) then) =
      _$UpdatePasswordStateCopyWithImpl<$Res, UpdatePasswordState>;
  @useResult
  $Res call({bool isLoading, bool success});
}

/// @nodoc
class _$UpdatePasswordStateCopyWithImpl<$Res, $Val extends UpdatePasswordState>
    implements $UpdatePasswordStateCopyWith<$Res> {
  _$UpdatePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePasswordStateImplCopyWith<$Res>
    implements $UpdatePasswordStateCopyWith<$Res> {
  factory _$$UpdatePasswordStateImplCopyWith(_$UpdatePasswordStateImpl value,
          $Res Function(_$UpdatePasswordStateImpl) then) =
      __$$UpdatePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool success});
}

/// @nodoc
class __$$UpdatePasswordStateImplCopyWithImpl<$Res>
    extends _$UpdatePasswordStateCopyWithImpl<$Res, _$UpdatePasswordStateImpl>
    implements _$$UpdatePasswordStateImplCopyWith<$Res> {
  __$$UpdatePasswordStateImplCopyWithImpl(_$UpdatePasswordStateImpl _value,
      $Res Function(_$UpdatePasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? success = null,
  }) {
    return _then(_$UpdatePasswordStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePasswordStateImpl implements _UpdatePasswordState {
  _$UpdatePasswordStateImpl({required this.isLoading, required this.success});

  factory _$UpdatePasswordStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePasswordStateImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final bool success;

  @override
  String toString() {
    return 'UpdatePasswordState(isLoading: $isLoading, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, success);

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordStateImplCopyWith<_$UpdatePasswordStateImpl> get copyWith =>
      __$$UpdatePasswordStateImplCopyWithImpl<_$UpdatePasswordStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePasswordStateImplToJson(
      this,
    );
  }
}

abstract class _UpdatePasswordState implements UpdatePasswordState {
  factory _UpdatePasswordState(
      {required final bool isLoading,
      required final bool success}) = _$UpdatePasswordStateImpl;

  factory _UpdatePasswordState.fromJson(Map<String, dynamic> json) =
      _$UpdatePasswordStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get success;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordStateImplCopyWith<_$UpdatePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
