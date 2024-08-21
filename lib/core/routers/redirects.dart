import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/features/auth/onBoarding/onBoarding_screen.dart';
import 'package:laundry_bin/features/authentication/view/pages/first_page_after_splash.dart';

/// A service class that is used to redirect the user to a specific page.
///
/// e.g. If the user is not logged in, then redirect the user to the login page.
/// or if the user is openeing the app for the first time, then redirect the user to the onboarding page,
/// etc.

class RouterRedirects {
  /// Redirects the user to the login page if the user is not logged in.
  static final _storage = GetStorage();

  /// A key that is used in the local storage to indicate that the user is
  /// already completed the onborading screen.
  ///
  /// The value can be either true or false.
  /// If the value is true, then the user has already completed the onboarding screen.
  /// If the value is false, then the user has not completed the onboarding screen.
  /// If there is no value, then the user has not completed the onboarding screen.

  static const _isfirstlaunchStorageKey = 'isfirstlaunch';

  /// Check if the user is opening the app for the first time.
  ///
  /// If the user already completed the onboarding screen, then redirect the user to
  /// the app home page.
  ///
  /// If the user is not opening the app for the first time, then do not redirect the user to any page.
  // static String? checkIsFirstLaunch(BuildContext context, GoRouterState state) {
  //   final bool isfirstlaunch =
  //       _storage.read<bool>(_isfirstlaunchStorageKey) ?? true;
  //   if (isfirstlaunch) {
  //     return OnBoarding.route;
  //   }
  //   return FirstPageAfterSplash.route;
  // }
  static String? checkLoggedIn(BuildContext context, GoRouterState state) {
    if (FirebaseAuth.instance.currentUser == null || !FirebaseAuth.instance.currentUser!.emailVerified) {
      return FirstPageAfterSplash.route;
    }
    return null;
  }

  static String? checkIsFirstLaunch(BuildContext context, GoRouterState state) {
    final bool isFirstLaunch =
        _storage.read<bool>(_isfirstlaunchStorageKey) ?? false;

    if (!isFirstLaunch) {
      return OnBoarding.route;
    }

    return null;
  }

  static void markAsFirstLaunch() {
    _storage.write(_isfirstlaunchStorageKey, true);
  }

  /// Mark the user as completed the onboarding screen.
  ///
  /// Once this is called, the user will not be redirected to the onboarding screen again.

  ///check if the user is logged in
}
