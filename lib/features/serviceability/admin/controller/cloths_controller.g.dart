// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloths_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allClothsHash() => r'4a455c0968119030e9060c982a3762b2545be847';

/// See also [allCloths].
@ProviderFor(allCloths)
final allClothsProvider = AutoDisposeStreamProvider<List<ClothsModel>>.internal(
  allCloths,
  name: r'allClothsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allClothsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllClothsRef = AutoDisposeStreamProviderRef<List<ClothsModel>>;
String _$clothsControllerHash() => r'85dbebeb41d4284f35e96cc50719b60162e5acf6';

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
