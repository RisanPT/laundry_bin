// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authsignin_with_google_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthSigninWithGoogleState _$AuthSigninWithGoogleStateFromJson(
    Map<String, dynamic> json) {
  return _AuthSigninWithGoogleState.fromJson(json);
}

/// @nodoc
mixin _$AuthSigninWithGoogleState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSigninWithGoogleStateCopyWith<AuthSigninWithGoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSigninWithGoogleStateCopyWith<$Res> {
  factory $AuthSigninWithGoogleStateCopyWith(AuthSigninWithGoogleState value,
          $Res Function(AuthSigninWithGoogleState) then) =
      _$AuthSigninWithGoogleStateCopyWithImpl<$Res, AuthSigninWithGoogleState>;
  @useResult
  $Res call({bool isLoading, bool authenticated});
}

/// @nodoc
class _$AuthSigninWithGoogleStateCopyWithImpl<$Res,
        $Val extends AuthSigninWithGoogleState>
    implements $AuthSigninWithGoogleStateCopyWith<$Res> {
  _$AuthSigninWithGoogleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authenticated = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSigninWithGoogleStateImplCopyWith<$Res>
    implements $AuthSigninWithGoogleStateCopyWith<$Res> {
  factory _$$AuthSigninWithGoogleStateImplCopyWith(
          _$AuthSigninWithGoogleStateImpl value,
          $Res Function(_$AuthSigninWithGoogleStateImpl) then) =
      __$$AuthSigninWithGoogleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool authenticated});
}

/// @nodoc
class __$$AuthSigninWithGoogleStateImplCopyWithImpl<$Res>
    extends _$AuthSigninWithGoogleStateCopyWithImpl<$Res,
        _$AuthSigninWithGoogleStateImpl>
    implements _$$AuthSigninWithGoogleStateImplCopyWith<$Res> {
  __$$AuthSigninWithGoogleStateImplCopyWithImpl(
      _$AuthSigninWithGoogleStateImpl _value,
      $Res Function(_$AuthSigninWithGoogleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authenticated = null,
  }) {
    return _then(_$AuthSigninWithGoogleStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthSigninWithGoogleStateImpl implements _AuthSigninWithGoogleState {
  const _$AuthSigninWithGoogleStateImpl(
      {required this.isLoading, required this.authenticated});

  factory _$AuthSigninWithGoogleStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSigninWithGoogleStateImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final bool authenticated;

  @override
  String toString() {
    return 'AuthSigninWithGoogleState(isLoading: $isLoading, authenticated: $authenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSigninWithGoogleStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, authenticated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSigninWithGoogleStateImplCopyWith<_$AuthSigninWithGoogleStateImpl>
      get copyWith => __$$AuthSigninWithGoogleStateImplCopyWithImpl<
          _$AuthSigninWithGoogleStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSigninWithGoogleStateImplToJson(
      this,
    );
  }
}

abstract class _AuthSigninWithGoogleState implements AuthSigninWithGoogleState {
  const factory _AuthSigninWithGoogleState(
      {required final bool isLoading,
      required final bool authenticated}) = _$AuthSigninWithGoogleStateImpl;

  factory _AuthSigninWithGoogleState.fromJson(Map<String, dynamic> json) =
      _$AuthSigninWithGoogleStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get authenticated;
  @override
  @JsonKey(ignore: true)
  _$$AuthSigninWithGoogleStateImplCopyWith<_$AuthSigninWithGoogleStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
