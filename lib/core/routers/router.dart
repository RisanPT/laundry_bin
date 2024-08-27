import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/routers/redirects.dart';
import 'package:laundry_bin/features/orders/user/view/pages/user_orders_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/on_boarding_screen.dart';
import 'package:laundry_bin/features/authentication/view/pages/navigation_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/password_changed_page.dart';
import 'package:laundry_bin/features/offers/view/pages/add_coupon_page.dart';
import 'package:laundry_bin/features/offers/view/pages/offer_page.dart';
import 'package:laundry_bin/features/offers/view/pages/offers_coupons_page.dart';
import 'package:laundry_bin/features/orders/user/view/pages/offer_page.dart';
import 'package:laundry_bin/features/profile/user/view/pages/user_profile_details.dart';
import 'package:laundry_bin/features/authentication/view/pages/first_page_after_splash.dart';
import 'package:laundry_bin/features/authentication/view/pages/forgot_password_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/otp_verification_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/phone_loginpage.dart';
import 'package:laundry_bin/features/authentication/view/pages/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/signin_page.dart';
import 'package:laundry_bin/core/widgets/animated_pagecontroller_widget.dart';
import 'package:laundry_bin/features/navigation/admin/view/pages/navigationapage.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/main.dart';
import 'package:laundry_bin/features/authentication/view/pages/homepage.dart';

final GoRouter router = GoRouter(
  initialLocation: NavigationPage.route,
  navigatorKey: Myapp.navigatorkey,
  routes: <GoRoute>[
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const SignUpPage());
      },
    ),
    GoRoute(
        path: '/navigation',
        pageBuilder: (context, state) {
          return customTransitionPage(child: const NavigationPage());
        },
        redirect: RouterRedirects.checkLoggedIn),
    GoRoute(
      path: '/home_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const HomePage());
      },
    ),
    GoRoute(
      path: '/signin',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const SigninPage());
      },
    ),
    GoRoute(
      path: '/onBoarding',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const OnBoarding());
      },
    ),
    GoRoute(
      path: '/password_changed_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const Passwordchanged());
      },
    ), GoRoute(
      path: '/user_orders_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const UserOrdersPage());
      },
    ),
    GoRoute(
      path: '/phone_login_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const PhoneLoginPage());
      },
    ),
    GoRoute(
      path: '/otpverification',
      builder: (context, state) => OtpVerificationPage(
        verificationid: state.extra as String,
      ),
    ),
    GoRoute(
      path: '/add_offer_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const AddOfferPage());
      },
    ),
    GoRoute(
      path: '/offers',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const OffersPage());
      },
    ),
    GoRoute(
      path: '/offers_coupons_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const OffersCouponsPage());
      },
    ),
    GoRoute(
      path: '/first_page_after_splash',
      builder: (context, state) => const FirstPageAfterSplash(),
      redirect: RouterRedirects.checkIsFirstLaunch,
    ),
    GoRoute(
      path: '/forgot_password_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const ForgotPassword());
      },
    ),
    GoRoute(
      path: '/navigation_admin_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const NavigationAdminPage());
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const ProfileDetailsScreen(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      path: '/addCoupon',
      name: 'addCoupon',
      builder: (context, state) => const AddCouponPage(),
    ),
    GoRoute(
      path: '/addOffer',
      name: 'addOffer',
      builder: (context, state) => const AddOfferPage(),
    ),
    GoRoute(
      path: '/home_page',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/offerPage',
      name: 'offerPage',
      builder: (context, state) => const OfferPage(),
    )
  ],
);
