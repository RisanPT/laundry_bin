import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/instructions/controller/model/instruction_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'instruction_db_services.g.dart';

final class InstructionDbServices {
  static final _instructionColloction = FirebaseFirestore.instance
      .collection('instructions')
      .withConverter(
          fromFirestore: InstructionModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());

  Future<void> addInstruction(InstructionModel instruction) async {
    await _instructionColloction.add(instruction);
  }

  Future<InstructionModel?> getInstructionById(String id) async {
    final doc = await _instructionColloction.doc(id).get();
    return doc.exists ? doc.data() : null;
  }

  Future<void> deleteInstruction(String instructionId) async {
    await _instructionColloction.doc(instructionId).delete();
  }

  Future<void> updateInstruction(InstructionModel instruction) async {
    await _instructionColloction.doc(instruction.id).set(instruction);
  }
  

  Stream<QuerySnapshot<InstructionModel>> getAllInstructions() {
    return _instructionColloction.snapshots();
  }
}

@riverpod
InstructionDbServices instructionDbServices(InstructionDbServicesRef ref) {
  return InstructionDbServices();
}
