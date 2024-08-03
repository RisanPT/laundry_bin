// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authsigninstate_with_phone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthSigninStateWithphone _$AuthSigninStateWithphoneFromJson(
    Map<String, dynamic> json) {
  return _AuthSigninStateWithphone.fromJson(json);
}

/// @nodoc
mixin _$AuthSigninStateWithphone {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;
  String? get phonenumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSigninStateWithphoneCopyWith<AuthSigninStateWithphone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSigninStateWithphoneCopyWith<$Res> {
  factory $AuthSigninStateWithphoneCopyWith(AuthSigninStateWithphone value,
          $Res Function(AuthSigninStateWithphone) then) =
      _$AuthSigninStateWithphoneCopyWithImpl<$Res, AuthSigninStateWithphone>;
  @useResult
  $Res call({bool isLoading, bool authenticated, String? phonenumber});
}

/// @nodoc
class _$AuthSigninStateWithphoneCopyWithImpl<$Res,
        $Val extends AuthSigninStateWithphone>
    implements $AuthSigninStateWithphoneCopyWith<$Res> {
  _$AuthSigninStateWithphoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authenticated = null,
    Object? phonenumber = freezed,
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
      phonenumber: freezed == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSigninStateWithphoneImplCopyWith<$Res>
    implements $AuthSigninStateWithphoneCopyWith<$Res> {
  factory _$$AuthSigninStateWithphoneImplCopyWith(
          _$AuthSigninStateWithphoneImpl value,
          $Res Function(_$AuthSigninStateWithphoneImpl) then) =
      __$$AuthSigninStateWithphoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool authenticated, String? phonenumber});
}

/// @nodoc
class __$$AuthSigninStateWithphoneImplCopyWithImpl<$Res>
    extends _$AuthSigninStateWithphoneCopyWithImpl<$Res,
        _$AuthSigninStateWithphoneImpl>
    implements _$$AuthSigninStateWithphoneImplCopyWith<$Res> {
  __$$AuthSigninStateWithphoneImplCopyWithImpl(
      _$AuthSigninStateWithphoneImpl _value,
      $Res Function(_$AuthSigninStateWithphoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authenticated = null,
    Object? phonenumber = freezed,
  }) {
    return _then(_$AuthSigninStateWithphoneImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      phonenumber: freezed == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthSigninStateWithphoneImpl implements _AuthSigninStateWithphone {
  _$AuthSigninStateWithphoneImpl(
      {required this.isLoading, required this.authenticated, this.phonenumber});

  factory _$AuthSigninStateWithphoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSigninStateWithphoneImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final bool authenticated;
  @override
  final String? phonenumber;

  @override
  String toString() {
    return 'AuthSigninStateWithphone(isLoading: $isLoading, authenticated: $authenticated, phonenumber: $phonenumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSigninStateWithphoneImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated) &&
            (identical(other.phonenumber, phonenumber) ||
                other.phonenumber == phonenumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, authenticated, phonenumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSigninStateWithphoneImplCopyWith<_$AuthSigninStateWithphoneImpl>
      get copyWith => __$$AuthSigninStateWithphoneImplCopyWithImpl<
          _$AuthSigninStateWithphoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSigninStateWithphoneImplToJson(
      this,
    );
  }
}

abstract class _AuthSigninStateWithphone implements AuthSigninStateWithphone {
  factory _AuthSigninStateWithphone(
      {required final bool isLoading,
      required final bool authenticated,
      final String? phonenumber}) = _$AuthSigninStateWithphoneImpl;

  factory _AuthSigninStateWithphone.fromJson(Map<String, dynamic> json) =
      _$AuthSigninStateWithphoneImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get authenticated;
  @override
  String? get phonenumber;
  @override
  @JsonKey(ignore: true)
  _$$AuthSigninStateWithphoneImplCopyWith<_$AuthSigninStateWithphoneImpl>
      get copyWith => throw _privateConstructorUsedError;
}
