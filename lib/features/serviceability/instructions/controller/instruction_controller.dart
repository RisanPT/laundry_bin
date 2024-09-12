import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/serviceability/instructions/controller/model/instruction_model.dart';
import 'package:laundry_bin/features/serviceability/instructions/services/instruction_db_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'instruction_controller.freezed.dart';
part 'instruction_controller.g.dart';

@freezed
class InstructionControllerState with _$InstructionControllerState {
  // The state now holds a list of InstructionModel instead of a list of strings.
  factory InstructionControllerState({
    required bool isLoading,
    // required List<InstructionModel> instructions,
  }) = _InstructionControllerState;
}

@Riverpod(keepAlive: true)
class InstructionController extends _$InstructionController {
  @override
  InstructionControllerState build() {
    return InstructionControllerState(
      // instructions: [],
      isLoading: false,
    );
  }

  // Method to add a new instruction
  Future<void> addInstruction(
      {required String title,
      List<Map<String, double>>? options,
      required String serviceId}) async {
    state = state.copyWith(isLoading: true);

    try {
      final newInstruction = InstructionModel(
        serviceId: serviceId,
        title: title,
        options: options,
      );

      // Add the new instruction to Firestore
      await ref
          .read(instructionDbServicesProvider)
          .addInstruction(newInstruction);

      // Update the state with the newly added instruction
      // state =
      //     state.copyWith(instructions: [...state.instructions, newInstruction]);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: "Failed to add instruction: $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

@riverpod
Stream<List<InstructionModel>> fetchInstructions(
    FetchInstructionsRef ref) async* {
  try {
    final Stream<QuerySnapshot<InstructionModel>> snapshotStream =
        ref.read(instructionDbServicesProvider).getAllInstructions();

    await for (final snapshot in snapshotStream) {
      final instructionsList = snapshot.docs.map((doc) => doc.data()).toList();
      yield instructionsList;
    }
  } catch (e) {
    SnackbarUtil.showsnackbar(message: "Failed to fetch instructions: $e");
    yield [];
  }
}
