import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/routers/router.dart';
import 'package:laundry_bin/core/theme/light_theme.dart';
import 'package:laundry_bin/firebase_options.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

Future<void> main() async{
  runApp(const ProviderScope(child: Myapp()));
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Myapp extends StatelessWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorkey = GlobalKey<NavigatorState>();
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        title: 'Flutter Demo',
        theme: lightTheme);
  }
}
