import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/widgets/coupon_container.dart';
import 'package:laundry_bin/features/home/user/view/widgets/home_page_header.dart';
import 'package:laundry_bin/features/home/user/view/widgets/indicator_widget.dart';
import 'package:laundry_bin/features/home/user/view/widgets/offer_banner_widget.dart';
import 'package:laundry_bin/features/home/user/view/widgets/grid_view_widget.dart';
import 'package:laundry_bin/features/offers/controllers/offer_controller.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
class UserHomePage extends HookConsumerWidget {
  // initialise banner controller
  final CarouselSliderController bannerController = CarouselSliderController();
  // initialise homepage path
  static const String route = '/user_home_page';

  UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBanner = useState(0);

    // Stream all offers using the getAllOffers provider
    final offersAsyncValue = ref.watch(getAllOffersProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.backgroundSubtle,
        body: SingleChildScrollView(
          child: Column(
            children: [
              
              // calling the home page header widget
              HomePageHeader(),
              SizedBox(height: context.space.space_200),

              // Using AsyncValue to handle loading and error states
              offersAsyncValue.when(
                data: (offers) {
                  if (offers.isEmpty) {
                    return const Text('No offers available');
                  }
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: offers.length,
                        carouselController: bannerController,
                        itemBuilder: (context, index, realIndex) {
                          final offer = offers[index];
                          return OfferBannerWidget(
                            isNetworkImg: offer.image != null,
                            color: Colors
                                .white, // Optionally use dynamic colors if needed
                            image: offer.image ?? Assets.images.imgWashingPage,
                            applyRadius: true,
                            width: double.infinity,
                            padding: EdgeInsets.all(context.space.space_200),
                          );
                        },
                        options: CarouselOptions(
                          height: context.space.space_100 * 21,
                          viewportFraction: 1,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          onPageChanged: (index, reason) {
                            currentBanner.value = index;
                          },
                        ),
                      ),
                      // Custom indicator widget
                      IndicatorWidget(currentPage: currentBanner.value),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Text('Error loading offers: $error'),
              ),

              SizedBox(height: context.space.space_200),
              // Couper container widget
              CouponContainer(),
              const ServicesGridViewWidget(),
              SizedBox(height: context.space.space_100 * 12),
            ],
          ),
        ),
      ),
    );
  }
}
