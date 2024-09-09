// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloths_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allClothsHash() => r'79f9c8badbf1e4de2d02f27f0e76eb7ac120995a';

/// See also [allCloths].
@ProviderFor(allCloths)
final allClothsProvider = StreamProvider<List<ClothsModel>>.internal(
  allCloths,
  name: r'allClothsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allClothsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllClothsRef = StreamProviderRef<List<ClothsModel>>;
String _$clothsControllerHash() => r'3bea36580a627400026cd7c0c25426ccd0844b65';

/// See also [ClothsController].
@ProviderFor(ClothsController)
final clothsControllerProvider =
    AutoDisposeNotifierProvider<ClothsController, void>.internal(
  ClothsController.new,
  name: r'clothsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clothsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClothsController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
