import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/controllers/checkbox/checkbox_controller.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/Summary/payment_container.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.backgroundSubtle,
        title: Text(
          AppLocalizations.of(context)!.offer,
          style: context.typography.h3,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.space.space_125,
          ),
          const OfferText2(index: 0),
          const OfferText2(index: 1),
          Padding(
            padding: EdgeInsets.all(context.space.space_250),
            child: Text(
              AppLocalizations.of(context)!.paymentMethod,
              style: context.typography.bodyLargeSemiBold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.space.space_250),
            child: PaymentMethod(
                txt: AppLocalizations.of(context)!.upi,
                clr1: const Color(0xFFfdecd2),
                svg1: Assets.icons.icUpi,
                svg2: Assets.icons.icArrowRightFAQ),
          )
        ],
      ),
    );
  }
}

class OfferText2 extends ConsumerWidget {
  final int index;

  const OfferText2({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCheckbox = ref.watch(selectedCheckboxProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.space.space_200,
          vertical: context.space.space_150),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(context.space.space_150)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.space.space_100),
                    child: Text(
                      AppLocalizations.of(context)!.offerFor(6),
                      style: context.typography.bodySemiBold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.space.space_100),
                    child: Text(
                      '499',
                      style: context.typography.h2
                          .copyWith(color: context.colors.hintTxt),
                    ),
                  ),
                ],
              ),
              Checkbox(
                  side: BorderSide(color: context.colors.primary, width: 2),
                  activeColor: context.colors.primary,
                  value: selectedCheckbox == index,
                  onChanged: (value) {
                    if (value == true) {
                      ref.read(selectedCheckboxProvider.notifier).state = index;
                    } else {
                      ref.read(selectedCheckboxProvider.notifier).state = null;
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
