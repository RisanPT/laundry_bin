import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/routers/router.dart';
import 'package:laundry_bin/core/theme/light_theme.dart';
import 'package:laundry_bin/features/authentication/view/pages/navigation_page.dart';
import 'package:laundry_bin/firebase_options.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const ProviderScope(child: Myapp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Myapp extends HookConsumerWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorkey = GlobalKey<NavigatorState>();
  const Myapp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
          navigatorkey.currentContext!.go(NavigationPage.route);
        });
      });
      return null;
    }, []);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      title: 'Laundry Bin',
      theme: lightTheme,
    );
  }
}
