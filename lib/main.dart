import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/routers/router.dart';
import 'package:laundry_bin/core/theme/light_theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Flutter Demo',
        theme: lightTheme);
  }
}
