import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/routers/router.dart';
import 'package:laundry_bin/core/theme/light_theme.dart';
import 'package:laundry_bin/features/orders/admin/view/pages/orders_details_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorkey = GlobalKey<NavigatorState>();
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OrdersDetailsPage(),
          title: 'Flutter Demo',
          theme: lightTheme),
    );
  }
}
