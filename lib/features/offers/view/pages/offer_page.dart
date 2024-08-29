import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/controllers/offer_controller.dart';
import 'package:laundry_bin/features/offers/view/widgets/elevated_button_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/offer_card_widget.dart';

class OffersPage extends ConsumerWidget {
  static const routpath = '/offers';
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerModels = ref.watch(offerControllerProvider);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(
              top: context.space.space_200,
              left: context.space.space_200,
              right: context.space.space_200,
              bottom: context.space.space_600 * 3,
            ),
            shrinkWrap: true,
            itemCount: offerModels.length,
            itemBuilder: (context, index) {
              final offer = offerModels[index];
              return OfferCard(
                offerTypeEnum: offer.offerTypeEnum,
                offerTypeValue: offer.offerTypeValue,
                minOrderValue: offer.minOrderValue,
                maxApplyCount: offer.maxApplyCount,
                title: offer.title,
                imagepath: offer.image,
                description: offer.description,
                startDate: offer.startDate,
                endDate: offer.endDate,
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
