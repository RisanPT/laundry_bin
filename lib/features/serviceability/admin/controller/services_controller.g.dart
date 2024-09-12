// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllServicesHash() => r'8a596cbf10ba5d10cda0c6a90a8d51671870878d';

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
<<<<<<< HEAD
    r'b13cbe4f6f6021795061d4ea368f03ba3632c1a4';
=======
    r'343e35c74b9ded40c6a163bc30662bddbb1a1021';
>>>>>>> 1188f5c315c0d52a5e5b8411f0143cf6f58d0feb

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
