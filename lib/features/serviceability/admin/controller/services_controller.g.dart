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
    r'9e344e7bc173275a3051f231271c76a76d6dc711';

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
