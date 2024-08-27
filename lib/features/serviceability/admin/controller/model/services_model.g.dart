// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServicesModelImpl _$$ServicesModelImplFromJson(Map<String, dynamic> json) =>
    _$ServicesModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      cloths: (json['cloths'] as List<dynamic>)
          .map((e) => ServiceClothModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServicesModelImplToJson(_$ServicesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'cloths': instance.cloths,
    };
