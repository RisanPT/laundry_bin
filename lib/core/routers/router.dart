import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/features/auth/Sign_in_page.dart';
import 'package:laundry_bin/features/auth/onBoarding/onBoarding_screen.dart';
import 'package:laundry_bin/features/auth/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/navigation_page.dart';
import 'package:laundry_bin/features/offers/view/pages/add_coupon_page.dart';
import 'package:laundry_bin/features/offers/view/pages/offer_page.dart';
import 'package:laundry_bin/features/offers/view/pages/offers_coupons_page.dart';
import 'package:laundry_bin/features/profile/user/view/pages/user_profile_details.dart';
import 'package:laundry_bin/features/authentication/view/pages/first_page_after_splash.dart';
import 'package:laundry_bin/features/authentication/view/pages/forgot_password_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/homepage.dart';
import 'package:laundry_bin/features/authentication/view/pages/otp_verification_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/phone_loginpage.dart';
import 'package:laundry_bin/features/authentication/view/pages/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/signin_page.dart';
import 'package:laundry_bin/core/widgets/animated_pagecontroller_widget.dart';
import 'package:laundry_bin/features/navigation/admin/view/pages/navigationapage.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/main.dart';

final GoRouter router = GoRouter(
  initialLocation:
      FirebaseAuth.instance.currentUser == null ? '/onboarding' : '/home_page',
  navigatorKey: Myapp.navigatorkey,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const FirstPageAfterSplash());
      },
    ),
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
    ),
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
      path: '/phonelogin',
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
    ),
    GoRoute(
      path: '/forgot_password',
      pageBuilder: (context, state) {
        return customTransitionPage(child: const ForgotPassword());
      },
    ),
    GoRoute(
      path: '/navigation_admin_page',
      pageBuilder: (context, state) {
        return customTransitionPage(child: NavigationAdminPage());
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const ProfileDetailsScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUp(),
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
  ],
);
