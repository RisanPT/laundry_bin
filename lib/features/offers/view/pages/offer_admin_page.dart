import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class OffersCouponsPage extends StatelessWidget {
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
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: [
              OfferCard(
                imagepath: Assets.images.imgOffer1,
                title: 'Offer1',
              ),
              SizedBox(height: 16.0),
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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 200,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        minimumSize: Size(180, 50)),
                    onPressed: () {
                      context.push('/add_offer_page');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: context.colors.white),
                        Text(
                          'Add Offers',
                          style: context.typography.bodySemiBold
                              .copyWith(color: context.colors.white),
                        ),
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String imagepath;

  OfferCard({required this.title, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SvgPicture.asset(
              imagepath), // ;Make sure to add images to assets folder
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
