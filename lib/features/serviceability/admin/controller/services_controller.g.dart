// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllServicesHash() => r'9b815db033faffb719f32e9054b19d377bd0a6c8';

/// See also [getAllServices].
@ProviderFor(getAllServices)
final getAllServicesProvider =
    AutoDisposeStreamProvider<List<ServicesModel>>.internal(
  getAllServices,
  name: r'getAllServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllServicesRef = AutoDisposeStreamProviderRef<List<ServicesModel>>;
String _$servicesControllerHash() =>
    r'eb9f838b430b972318b2e7225a0ee847e0614f9d';

/// See also [ServicesController].
@ProviderFor(ServicesController)
final servicesControllerProvider =
    NotifierProvider<ServicesController, ServiceControllerState>.internal(
  ServicesController.new,
  name: r'servicesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$servicesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServicesController = Notifier<ServiceControllerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
