import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/routers/router.dart';
import 'package:laundry_bin/core/theme/light_theme.dart';
import 'package:laundry_bin/features/authentication/view/pages/first_page_after_splash.dart';
import 'package:laundry_bin/features/authentication/view/pages/homepage.dart';
import 'package:laundry_bin/firebase_options.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: Myapp()));
}

class Myapp extends HookWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorkey = GlobalKey<NavigatorState>();
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            navigatorkey.currentContext?.go(FirstPageAfterSplash.route);
          } else {
            navigatorkey.currentContext?.go(HomePage.route);
          }
        });
      });
      return null;
    });

    return MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: router,
        title: 'Laundry Bin',
        theme: lightTheme);
  }
}
