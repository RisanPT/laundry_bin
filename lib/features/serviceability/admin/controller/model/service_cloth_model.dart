import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_cloth_model.freezed.dart';
part 'service_cloth_model.g.dart';

@freezed
class ServiceClothModel with _$ServiceClothModel {
  const ServiceClothModel._();

  const factory ServiceClothModel({
    required String clothId,
    required double price,
  }) = _ServiceClothModel;

  factory ServiceClothModel.fromJson(Map<String, Object?> json) =>
      _$ServiceClothModelFromJson(json);
}
