import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/controllers/offer_filepicker_controller.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/features/offers/view/widgets/elevated_button_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/offer_card_widget.dart';

class OffersPage extends ConsumerWidget {
  static const routpath='/offers';
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
  Widget build(BuildContext context, WidgetRef ref) {
    final filepickerprovider = ref.watch(pickedFilePathProvider);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            itemCount: filepickerprovider.length,
            itemBuilder: (context, index) {
              final offer = filepickerprovider[index];
              return OfferCard(
                title:
                    offer.title.isNotEmpty ? offer.title : 'Offer ${index + 1}',
                imagepath: offer.image,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.space.space_600 * 2),
              child: ElevatedButtonWidget(
                text: 'Add Offer',
                onPressed: () {
                  context.pushNamed('addOffer');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
