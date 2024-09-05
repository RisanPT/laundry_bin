// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_logout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthLogoutState _$AuthLogoutStateFromJson(Map<String, dynamic> json) {
  return _AuthLogoutState.fromJson(json);
}

/// @nodoc
mixin _$AuthLogoutState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;

  /// Serializes this AuthLogoutState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthLogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthLogoutStateCopyWith<AuthLogoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthLogoutStateCopyWith<$Res> {
  factory $AuthLogoutStateCopyWith(
          AuthLogoutState value, $Res Function(AuthLogoutState) then) =
      _$AuthLogoutStateCopyWithImpl<$Res, AuthLogoutState>;
  @useResult
  $Res call({bool isLoading, bool authenticated});
}

/// @nodoc
class _$AuthLogoutStateCopyWithImpl<$Res, $Val extends AuthLogoutState>
    implements $AuthLogoutStateCopyWith<$Res> {
  _$AuthLogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthLogoutState
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
abstract class _$$AuthLogoutStateImplCopyWith<$Res>
    implements $AuthLogoutStateCopyWith<$Res> {
  factory _$$AuthLogoutStateImplCopyWith(_$AuthLogoutStateImpl value,
          $Res Function(_$AuthLogoutStateImpl) then) =
      __$$AuthLogoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool authenticated});
}

/// @nodoc
class __$$AuthLogoutStateImplCopyWithImpl<$Res>
    extends _$AuthLogoutStateCopyWithImpl<$Res, _$AuthLogoutStateImpl>
    implements _$$AuthLogoutStateImplCopyWith<$Res> {
  __$$AuthLogoutStateImplCopyWithImpl(
      _$AuthLogoutStateImpl _value, $Res Function(_$AuthLogoutStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthLogoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authenticated = null,
  }) {
    return _then(_$AuthLogoutStateImpl(
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
class _$AuthLogoutStateImpl implements _AuthLogoutState {
  const _$AuthLogoutStateImpl(
      {this.isLoading = false, this.authenticated = false});

  factory _$AuthLogoutStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthLogoutStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool authenticated;

  @override
  String toString() {
    return 'AuthLogoutState(isLoading: $isLoading, authenticated: $authenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLogoutStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, authenticated);

  /// Create a copy of AuthLogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLogoutStateImplCopyWith<_$AuthLogoutStateImpl> get copyWith =>
      __$$AuthLogoutStateImplCopyWithImpl<_$AuthLogoutStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthLogoutStateImplToJson(
      this,
    );
  }
}

abstract class _AuthLogoutState implements AuthLogoutState {
  const factory _AuthLogoutState(
      {final bool isLoading, final bool authenticated}) = _$AuthLogoutStateImpl;

  factory _AuthLogoutState.fromJson(Map<String, dynamic> json) =
      _$AuthLogoutStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get authenticated;

  /// Create a copy of AuthLogoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthLogoutStateImplCopyWith<_$AuthLogoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
