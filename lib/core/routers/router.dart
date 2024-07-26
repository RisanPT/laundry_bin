import 'package:go_router/go_router.dart';

import 'package:laundry_bin/features/auth/Sign_in_page.dart';
import 'package:laundry_bin/features/auth/home_page.dart';
import 'package:laundry_bin/features/auth/onBoarding/onBoarding_screenn.dart';
import 'package:laundry_bin/features/auth/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/first_page_after_splash.dart';
import 'package:laundry_bin/features/authentication/view/pages/otp_verification_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/phone_loginpage.dart';
import 'package:laundry_bin/features/authentication/view/pages/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/signin_page.dart';
import 'package:laundry_bin/features/map/view/pages/map_page.dart';
import 'package:laundry_bin/features/offers/view/pages/offer_admin_page.dart';
import 'package:laundry_bin/main.dart';
import 'package:laundry_bin/splash_screen/splash_screen.dart';

final GoRouter router =
    GoRouter(navigatorKey: Myapp.navigatorkey, routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => OffersCouponsPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => SignUpPage(),
  ),
  GoRoute(
    path: '/signin',
    builder: (context, state) => const SigninPage(),
  ),
  GoRoute(
    path: '/onBoarding',
    builder: (context, state) => const OnBoarding(),
  ),
  GoRoute(
    path: '/phonelogin',
    builder: (context, state) => PhoneLoginPage(),
  ),
  GoRoute(
    path: '/otpverification',
    builder: (context, state) => OtpVerificationPage(
      verificationid: state.extra as String,
    ),
  )
]);
