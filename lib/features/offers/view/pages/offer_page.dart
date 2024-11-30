import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';
import 'package:laundry_bin/features/offers/controllers/offer_controller.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/features/offers/view/widgets/elevated_button_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/offer_card_widget.dart';

class OffersPage extends ConsumerWidget {
  static const routpath = '/offers';
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerModels = ref.watch(getAllOffersProvider);
    return Scaffold(
      body: Stack(
        children: [
          offerModels.when(
              data: (offers) {
                return ListView.builder(
                  padding: EdgeInsets.only(
                    top: context.space.space_200,
                    left: context.space.space_200,
                    right: context.space.space_200,
                    bottom: context.space.space_600 * 3,
                  ),
                  shrinkWrap: true,
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return OfferCard(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text(context.l10n.offer),
                              content: const Text(
                                  'Are you sure you want to delete this item?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    // Changed to editService
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(offerControllerProvider.notifier)
                                        .deleteOffer(offer.id);

                                    context.pop();
                                    // Navigator.of(context).pop();
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onTap: () {
                        context.push(AddOfferPage.route, extra: offer);
                      },
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
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const LoadingIndicator()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.space.space_600 * 2),
              child: ElevatedButtonWidget(
                text: 'Add Offer',
                onPressed: () {
                  context.push(AddOfferPage.route);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
