// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllServicesHash() => r'f26a12ef9dc8d8d4d6dc6f6f09f47ab68d30b89d';

/// See also [getAllServices].
@ProviderFor(getAllServices)
final getAllServicesProvider = StreamProvider<List<ServicesModel>>.internal(
  getAllServices,
  name: r'getAllServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllServicesRef = StreamProviderRef<List<ServicesModel>>;
String _$servicesControllerHash() =>
    r'1368bf941e0d1fc624304bea301de80a1c01fd50';

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
