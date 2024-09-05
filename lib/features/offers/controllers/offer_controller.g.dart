// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllOffersHash() => r'203ef37fca2d08d2ac02b8479f1b403f2d068c94';

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
String _$offerControllerHash() => r'2763ce6120157085ccb49446aeb7612376002ab8';

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
