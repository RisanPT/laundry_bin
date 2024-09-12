import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/controller/get_services_controller.dart';
import 'package:laundry_bin/features/home/user/view/widgets/coupon_container.dart';
import 'package:laundry_bin/features/home/user/view/widgets/home_page_header.dart';
import 'package:laundry_bin/features/home/user/view/widgets/indicator_widget.dart';
import 'package:laundry_bin/features/home/user/view/widgets/offer_banner_widget.dart';
import 'package:laundry_bin/features/home/user/view/widgets/grid_view_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class UserHomePage extends HookConsumerWidget {
  //initialise banner controller
  final CarouselSliderController bannerController = CarouselSliderController();
  //initialise homepage path
  static const String route = '/user_home_page';
  //initialise colors for the banner container
  final List<Color> colors = [Colors.blue, Colors.red, Colors.green];

  UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBanner = useState(0);
    final asyncServices = ref.watch(servicesStreamProvider);
    return Scaffold(
      backgroundColor: context.colors.backgroundSubtle,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // calling the home page header widget
            // there is not any parameter in the constructor
            HomePageHeader(),
            SizedBox(
              height: context.space.space_200,
            ),

            CarouselSlider.builder(
                itemCount: colors.length,
                carouselController: bannerController,
                itemBuilder: (context, index, realIndex) {
                  // offer banner widget .its an image banner of ongoing offers.
                  // image parameter is an required parameter.
                  // other parameters are optional.
                  // if applyRadius parameter is true, the banner will be rounded.
                  // if height parameter is not null, the banner will have the specified height.
                  // if width parameter is not null, the banner will have the specified width.
                  // if padding parameter is not null, the banner will have the specified padding.
                  return OfferBannerWidget(
                    color: colors[index],
                    image: Assets.images.imgWashingPage,
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
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      currentBanner.value = index;
                    })),
            //Custom indicator widget
            //pass the current banner index to the widget to change the indicator states
            IndicatorWidget(currentPage: currentBanner.value),
            SizedBox(
              height: context.space.space_200,
            ),
            //Couper container widget
            CouponContainer(),

            const ServicesGridViewWidget(),

            SizedBox(
              height: context.space.space_100 * 12,
            ),
          ],
        ),
      ),
    );
  }
}
