import 'package:go_router/go_router.dart';
import 'package:laundry_bin/features/auth/Sign_in_page.dart';
import 'package:laundry_bin/features/auth/onBoarding/onBoarding_screen.dart';

import 'package:laundry_bin/features/auth/sign_up_page.dart';
import 'package:laundry_bin/features/profile/user/view/pages/profile_page.dart';
import 'package:laundry_bin/features/profile/user/view/pages/user_profile_details.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
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
  )
]);
