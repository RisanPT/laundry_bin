import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/view/pages/coupon_page.dart';
import 'package:laundry_bin/features/offers/view/pages/offer_page.dart';

class OffersCouponsPage extends StatelessWidget {
  static const routePath = '/offers_coupons_page';
  const OffersCouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: context.typography.bodySemiBold,
            unselectedLabelStyle: context.typography.bodySmallSemiBold,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: context.colors.primary,
            labelColor: context.colors.primary,
            unselectedLabelColor: context.colors.primaryTxt,
            tabs: const [
              Tab(text: 'Offers'),
              Tab(text: 'Coupons'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [OffersPage(), CoupenPage()],
        ),
      ),
    );
  }
}




