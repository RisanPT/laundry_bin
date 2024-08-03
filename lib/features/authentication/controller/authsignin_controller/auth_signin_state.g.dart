// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_signin_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthSigninStateImpl _$$AuthSigninStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthSigninStateImpl(
      isLoading: json['isLoading'] as bool,
      authenticated: json['authenticated'] as bool,
    );

Map<String, dynamic> _$$AuthSigninStateImplToJson(
        _$AuthSigninStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'authenticated': instance.authenticated,
    };
