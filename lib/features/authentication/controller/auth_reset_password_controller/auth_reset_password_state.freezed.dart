// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResetPasswordState _$AuthResetPasswordStateFromJson(
    Map<String, dynamic> json) {
  return _AuthResetPasswordState.fromJson(json);
}

/// @nodoc
mixin _$AuthResetPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResetPasswordStateCopyWith<AuthResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResetPasswordStateCopyWith<$Res> {
  factory $AuthResetPasswordStateCopyWith(AuthResetPasswordState value,
          $Res Function(AuthResetPasswordState) then) =
      _$AuthResetPasswordStateCopyWithImpl<$Res, AuthResetPasswordState>;
  @useResult
  $Res call({bool isLoading, bool success});
}

/// @nodoc
class _$AuthResetPasswordStateCopyWithImpl<$Res,
        $Val extends AuthResetPasswordState>
    implements $AuthResetPasswordStateCopyWith<$Res> {
  _$AuthResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$AuthResetPasswordStateImplCopyWith<$Res>
    implements $AuthResetPasswordStateCopyWith<$Res> {
  factory _$$AuthResetPasswordStateImplCopyWith(
          _$AuthResetPasswordStateImpl value,
          $Res Function(_$AuthResetPasswordStateImpl) then) =
      __$$AuthResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool success});
}

/// @nodoc
class __$$AuthResetPasswordStateImplCopyWithImpl<$Res>
    extends _$AuthResetPasswordStateCopyWithImpl<$Res,
        _$AuthResetPasswordStateImpl>
    implements _$$AuthResetPasswordStateImplCopyWith<$Res> {
  __$$AuthResetPasswordStateImplCopyWithImpl(
      _$AuthResetPasswordStateImpl _value,
      $Res Function(_$AuthResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? success = null,
  }) {
    return _then(_$AuthResetPasswordStateImpl(
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
class _$AuthResetPasswordStateImpl implements _AuthResetPasswordState {
  const _$AuthResetPasswordStateImpl(
      {this.isLoading = false, this.success = false});

  factory _$AuthResetPasswordStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResetPasswordStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'AuthResetPasswordState(isLoading: $isLoading, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResetPasswordStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResetPasswordStateImplCopyWith<_$AuthResetPasswordStateImpl>
      get copyWith => __$$AuthResetPasswordStateImplCopyWithImpl<
          _$AuthResetPasswordStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResetPasswordStateImplToJson(
      this,
    );
  }
}

abstract class _AuthResetPasswordState implements AuthResetPasswordState {
  const factory _AuthResetPasswordState(
      {final bool isLoading,
      final bool success}) = _$AuthResetPasswordStateImpl;

  factory _AuthResetPasswordState.fromJson(Map<String, dynamic> json) =
      _$AuthResetPasswordStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$AuthResetPasswordStateImplCopyWith<_$AuthResetPasswordStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
