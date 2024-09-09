// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllOffersHash() => r'77f0f5f94dc64d4c485be983870f0517d96e313f';

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
String _$offerControllerHash() => r'4bea999f81c3188bedf72c7360941e4f16689b3b';

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
