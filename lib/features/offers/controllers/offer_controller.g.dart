// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllOffersHash() => r'1a84934baa85fb098199fe72ac9599edcf0cb9c1';

/// See also [getAllOffers].
@ProviderFor(getAllOffers)
final getAllOffersProvider = StreamProvider<List<OfferModel>>.internal(
  getAllOffers,
  name: r'getAllOffersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllOffersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllOffersRef = StreamProviderRef<List<OfferModel>>;
String _$offerControllerHash() => r'607f02709697099c0b0582664dc601d4c402499f';

/// See also [OfferController].
@ProviderFor(OfferController)
final offerControllerProvider =
    AutoDisposeNotifierProvider<OfferController, OfferControllerState>.internal(
  OfferController.new,
  name: r'offerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$offerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OfferController = AutoDisposeNotifier<OfferControllerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
