import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/pages/orders_page.dart';
import 'package:laundry_bin/features/home/user/view/pages/sample_page2.dart';
import 'package:laundry_bin/features/home/user/view/pages/sample_page3.dart';
import 'package:laundry_bin/features/home/user/view/pages/user_home_page.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class UserNavigationPage extends HookConsumerWidget {
  static const String route = '/user_navigation_page';
  const UserNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final navBarIndex = useState(0);

    return Scaffold(
        backgroundColor: context.colors.white,
        extendBody: true,
        body: PageView(
          onPageChanged: (value) {
            navBarIndex.value = value;
          },
          controller: pageController,
          children: [
            UserHomePage(),
            const OrdersPage(),
            const SamplePage2(),
            const SamplePage3(),
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
                        navBarIndex.value == 0
                            ? Assets.icons.iconMenubarHomescreen
                            : Assets.icons.iconMenubarHomescreen,
                        colorFilter: navBarIndex.value == 0
                            ? ColorFilter.mode(
                                context.colors.primary, BlendMode.srcIn)
                            : ColorFilter.mode(context.colors.containerShadow,
                                BlendMode.srcIn),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: SvgPicture.asset(
                          navBarIndex.value == 1
                              ? Assets.icons.iconCalendarHomescreen
                              : Assets.icons.iconCalendarHomescreen,
                          colorFilter: navBarIndex.value == 1
                              ? ColorFilter.mode(
                                  context.colors.primary, BlendMode.srcIn)
                              : ColorFilter.mode(context.colors.containerShadow,
                                  BlendMode.srcIn),
                        )),
                    IconButton(
                        onPressed: () {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: SvgPicture.asset(
                          navBarIndex.value == 2
                              ? Assets.icons.iconNotificationHomescreen
                              : Assets.icons.iconNotificationHomescreen,
                          colorFilter: navBarIndex.value == 2
                              ? ColorFilter.mode(
                                  context.colors.primary, BlendMode.srcIn)
                              : ColorFilter.mode(context.colors.containerShadow,
                                  BlendMode.srcIn),
                        )),
                    IconButton(
                        onPressed: () {
                          pageController.animateToPage(3,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: SvgPicture.asset(
                          navBarIndex.value == 3
                              ? Assets.icons.iconUserHomescreen
                              : Assets.icons.iconUserHomescreen,
                          colorFilter: navBarIndex.value == 3
                              ? ColorFilter.mode(
                                  context.colors.primary, BlendMode.srcIn)
                              : ColorFilter.mode(context.colors.containerShadow,
                                  BlendMode.srcIn),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
