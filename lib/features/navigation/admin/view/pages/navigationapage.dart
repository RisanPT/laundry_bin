import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/navigation/admin/controller/bottomtabcontroller.dart';
import 'package:laundry_bin/features/offers/view/pages/offer_admin_page.dart';
import 'package:laundry_bin/features/orders/admin/view/pages/admin_profile_Page.dart';
import 'package:laundry_bin/features/orders/admin/view/pages/order_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/services_page.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class NavigationAdminPage extends HookConsumerWidget {
  const NavigationAdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomTabControllerProvider);
    final pageController = usePageController();

    return Scaffold(
        backgroundColor: context.colors.white,
        extendBody: true,
        body: PageView(
          onPageChanged: (value) {
            ref.read(bottomTabControllerProvider.notifier).changeIndex(value);
          },
          controller: pageController,
          children: [
            const AllOrdersPage(),
            const ServicesPage(),
            OffersCouponsPage(),
            const AdminProfilePage()
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 26,
                  offset: Offset(2, 2),
                  spreadRadius: -2,
                  color: Color.fromARGB(68, 0, 0, 0),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BottomAppBar(
                shape: const AutomaticNotchedShape(
                  RoundedRectangleBorder(),
                  StadiumBorder(),
                ),
                color: context.colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      icon: SvgPicture.asset(
                        bottomIndex == 0
                            ? Assets.icons.icOrdersFilled
                            : Assets.icons.icOrdersOutline,
                        colorFilter: ColorFilter.mode(
                          bottomIndex == 0
                              ? context.colors.primary
                              : context.colors.containerShadow,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: SvgPicture.asset(
                          bottomIndex == 1
                              ? Assets.icons.icSevicesFilled
                              : Assets.icons.icServicesOutline,
                          colorFilter: ColorFilter.mode(
                            bottomIndex == 1
                                ? context.colors.primary
                                : context.colors.containerShadow,
                            BlendMode.srcIn,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: SvgPicture.asset(
                          bottomIndex == 2
                              ? Assets.icons.icOffersFilled
                              : Assets.icons.icOffersOutline,
                          colorFilter: ColorFilter.mode(
                            bottomIndex == 2
                                ? context.colors.primary
                                : context.colors.containerShadow,
                            BlendMode.srcIn,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          pageController.animateToPage(3,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: SvgPicture.asset(
                          bottomIndex == 3
                              ? Assets.icons.icAdminProfileFilled
                              : Assets.icons.icAdminProfileOutline,
                          colorFilter: ColorFilter.mode(
                            bottomIndex == 3
                                ? context.colors.primary
                                : context.colors.containerShadow,
                            BlendMode.srcIn,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
