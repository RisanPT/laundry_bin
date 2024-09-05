// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthSigninState _$AuthSigninStateFromJson(Map<String, dynamic> json) {
  return _AuthSigninState.fromJson(json);
}

/// @nodoc
mixin _$AuthSigninState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;

  /// Serializes this AuthSigninState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthSigninState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthSigninStateCopyWith<AuthSigninState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSigninStateCopyWith<$Res> {
  factory $AuthSigninStateCopyWith(
          AuthSigninState value, $Res Function(AuthSigninState) then) =
      _$AuthSigninStateCopyWithImpl<$Res, AuthSigninState>;
  @useResult
  $Res call({bool isLoading, bool authenticated});
}

/// @nodoc
class _$AuthSigninStateCopyWithImpl<$Res, $Val extends AuthSigninState>
    implements $AuthSigninStateCopyWith<$Res> {
  _$AuthSigninStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthSigninState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$AuthSigninStateImplCopyWith<$Res>
    implements $AuthSigninStateCopyWith<$Res> {
  factory _$$AuthSigninStateImplCopyWith(_$AuthSigninStateImpl value,
          $Res Function(_$AuthSigninStateImpl) then) =
      __$$AuthSigninStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool authenticated});
}

/// @nodoc
class __$$AuthSigninStateImplCopyWithImpl<$Res>
    extends _$AuthSigninStateCopyWithImpl<$Res, _$AuthSigninStateImpl>
    implements _$$AuthSigninStateImplCopyWith<$Res> {
  __$$AuthSigninStateImplCopyWithImpl(
      _$AuthSigninStateImpl _value, $Res Function(_$AuthSigninStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthSigninState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authenticated = null,
  }) {
    return _then(_$AuthSigninStateImpl(
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
class _$AuthSigninStateImpl implements _AuthSigninState {
  _$AuthSigninStateImpl({required this.isLoading, required this.authenticated});

  factory _$AuthSigninStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSigninStateImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final bool authenticated;

  @override
  String toString() {
    return 'AuthSigninState(isLoading: $isLoading, authenticated: $authenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSigninStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, authenticated);

  /// Create a copy of AuthSigninState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSigninStateImplCopyWith<_$AuthSigninStateImpl> get copyWith =>
      __$$AuthSigninStateImplCopyWithImpl<_$AuthSigninStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSigninStateImplToJson(
      this,
    );
  }
}

abstract class _AuthSigninState implements AuthSigninState {
  factory _AuthSigninState(
      {required final bool isLoading,
      required final bool authenticated}) = _$AuthSigninStateImpl;

  factory _AuthSigninState.fromJson(Map<String, dynamic> json) =
      _$AuthSigninStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get authenticated;

  /// Create a copy of AuthSigninState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSigninStateImplCopyWith<_$AuthSigninStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
