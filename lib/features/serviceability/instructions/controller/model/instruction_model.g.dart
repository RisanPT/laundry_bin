// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructionModelImpl _$$InstructionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionModelImpl(
      id: json['id'] as String?,
      serviceId: json['serviceId'] as String,
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
    );

Map<String, dynamic> _$$InstructionModelImplToJson(
        _$InstructionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceId': instance.serviceId,
      'title': instance.title,
      'options': instance.options,
    };
