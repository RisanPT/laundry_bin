import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloths_model.freezed.dart';
part 'cloths_model.g.dart';

@freezed
class ClothsModel with _$ClothsModel {
  const factory ClothsModel({
    required String id,
    required String clothname,
    required String clothimage,
  }) = _ClothsModel;

  factory ClothsModel.fromJson(Map<String, Object?> json) =>
      _$ClothsModelFromJson(json);

  factory ClothsModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;

    return ClothsModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }
}
