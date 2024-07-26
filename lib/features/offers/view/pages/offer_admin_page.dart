import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class OffersCouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: context.colors.primary,
            labelColor: context.colors.primary,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'Offers'),
              Tab(text: 'Coupons'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OffersPage(),
            CouponsPage(),
          ],
        ),
      ),
    );
  }
}

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        OfferCard(
          title: '50% off on Washing',
        ),
        OfferCard(
          title: '50% off on Washing',
        ),
        // Add more OfferCards here...
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;

  OfferCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SvgPicture.asset(Assets.images
              .imgWashingPage), // ;Make sure to add images to assets folder
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class CouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coupons Page'),
    );
  }
}
