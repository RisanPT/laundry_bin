import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instruction_model.freezed.dart';
part 'instruction_model.g.dart';

@freezed
class InstructionModel with _$InstructionModel {  
  const InstructionModel._();
  factory InstructionModel(
      {String? id,
      required String serviceId,
      required String title,
      List<Map<String, double>>? options}) = _InstructionModel;

  factory InstructionModel.fromJson(Map<String, Object?> json) =>
      _$InstructionModelFromJson(json);

  factory InstructionModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;

    return InstructionModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }
}
