// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authsigninstate_with_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthSigninStateWithphoneImpl _$$AuthSigninStateWithphoneImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthSigninStateWithphoneImpl(
      isLoading: json['isLoading'] as bool,
      authenticated: json['authenticated'] as bool,
      phonenumber: json['phonenumber'] as String?,
    );

Map<String, dynamic> _$$AuthSigninStateWithphoneImplToJson(
        _$AuthSigninStateWithphoneImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'authenticated': instance.authenticated,
      'phonenumber': instance.phonenumber,
    };
