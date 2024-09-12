// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchInstructionsHash() => r'40954bf5f445a30e386f1ee5c8239f59369338d9';

/// See also [fetchInstructions].
@ProviderFor(fetchInstructions)
final fetchInstructionsProvider =
    AutoDisposeStreamProvider<List<InstructionModel>>.internal(
  fetchInstructions,
  name: r'fetchInstructionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchInstructionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchInstructionsRef
    = AutoDisposeStreamProviderRef<List<InstructionModel>>;
String _$instructionControllerHash() =>
<<<<<<< HEAD
    r'197b2b543fb40ba82a1bbce18959f6de3ee58f3e';
=======
    r'42c2a6bdec182cc9b0c34384f7bb2a414012ce31';
>>>>>>> 1188f5c315c0d52a5e5b8411f0143cf6f58d0feb

/// See also [InstructionController].
@ProviderFor(InstructionController)
final instructionControllerProvider = NotifierProvider<InstructionController,
    InstructionControllerState>.internal(
  InstructionController.new,
  name: r'instructionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$instructionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InstructionController = Notifier<InstructionControllerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
