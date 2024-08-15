// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_logout_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthLogoutStateImpl _$$AuthLogoutStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthLogoutStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      authenticated: json['authenticated'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthLogoutStateImplToJson(
        _$AuthLogoutStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'authenticated': instance.authenticated,
    };
