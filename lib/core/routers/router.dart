import 'package:go_router/go_router.dart';
import 'package:laundry_bin/feature/auth/Sign_in_page.dart';
import 'package:laundry_bin/feature/auth/home_page.dart';
import 'package:laundry_bin/feature/auth/sign_up_page.dart';
import 'package:laundry_bin/features/profile/user/view/pages/user_profile_details.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => ProfileDetailsScreen(),
  ),
  GoRoute(
    path: '/signin',
    builder: (context, state) => SignIn(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => SignUp(),
  )
]);
