import 'package:go_router/go_router.dart';

import 'package:laundry_bin/features/auth/Sign_in_page.dart';
import 'package:laundry_bin/features/auth/onBoarding/onBoarding_screen.dart';
import 'package:laundry_bin/features/auth/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/first_page_after_splash.dart';
import 'package:laundry_bin/features/authentication/view/pages/otp_verification_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/phone_loginpage.dart';
import 'package:laundry_bin/features/authentication/view/pages/sign_up_page.dart';
import 'package:laundry_bin/features/authentication/view/pages/signin_page.dart';
import 'package:laundry_bin/features/offers/view/pages/add_offer_page.dart';
import 'package:laundry_bin/main.dart';

final GoRouter router =
    GoRouter(navigatorKey: Myapp.navigatorkey, routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => const FirstPageAfterSplash(),
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
    builder: (context, state) => const PhoneLoginPage(),
  ),
  GoRoute(
    path: '/otpverification',
    builder: (context, state) => OtpVerificationPage(
      verificationid: state.extra as String,
    ),
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
    path: '/add_offer_page',
    builder: (context, state) => const AddOfferPage(),
  ),
]);
