import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/features/offers/view/widgets/elevated_button_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/offer_card_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
/// Builds the UI for the OffersPage.
///
/// Returns a [Scaffold] widget that contains a [Stack] of [ListView] and
/// [Positioned] widgets. The [ListView] contains a list of [OfferCard] widgets
/// and a [SizedBox] widget. The [Positioned] widget contains an
/// [ElevatedButtonWidget] that navigates to the [AddOfferPage] when pressed.
///
/// The [BuildContext] parameter is used to access the [Navigator] and
/// [MaterialPageRoute] objects.
///
/// Returns a [Scaffold] widget.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: [
              OfferCard(
                imagepath: Assets.images.icLaundryIcLogoCombined,
                title: 'Offer1',
              ),
              const SizedBox(height: 16.0),
              OfferCard(
                imagepath: Assets.images.imgShirtProfilePage,
                title: 'offer2',
              ),
              OfferCard(
                imagepath: Assets.images.imgOnbord,
                title: 'offer2',
              ),
              OfferCard(
                imagepath: Assets.images.imgAuthBackground,
                title: 'offer2',
              ),
              OfferCard(
                imagepath: Assets.images.imgWashingPage,
                title: 'offer2',
              ),
              // Add more OfferCard widgets as needed
            ],
          ),
          Positioned(
            left: 120,
            right: 120,
            bottom: 100,
            child: ElevatedButtonWidget(
              text: 'Add Offer',
              onPressed: () {
                context.pushNamed('addOffer');
              },
            ),
          ),
        ],
      ),
    );
  }
}