// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllServicesHash() => r'990d664475313802670d7fea7c1b164b578b4aa6';

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
    r'793166293fbbd1ea7af5d8c8efb9bb7cd8398079';

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
