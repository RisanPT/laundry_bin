import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/features/offers/view/pages/coupon_page.dart';
import 'package:laundry_bin/features/offers/view/widgets/elevated_button_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class OffersCouponsPage extends StatelessWidget {
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

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddOfferPage(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String imagepath;

  const OfferCard({super.key, required this.title, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SvgPicture.asset(
              imagepath), // ;Make sure to add images to assets folder
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
