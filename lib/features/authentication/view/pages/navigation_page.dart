import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';

import 'package:laundry_bin/features/authentication/controller/authsignin_controller/auth_sign_in_controller.dart';
import 'package:laundry_bin/features/navigation/admin/view/pages/navigationapage.dart';
import 'package:laundry_bin/features/navigation/user/view/pages/user_navigation_page.dart';

class NavigationPage extends HookConsumerWidget {
  static const route = '/navigation';

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future(() async {
        bool isAdminUser =
            await ref.read(authSignInProviderProvider.notifier).isAdmin();
        String? route;

        if (isAdminUser) {
          route = NavigationAdminPage.route;
          if (context.mounted) {
            context.go(route);
          }
        } else {
          route = UserNavigationPage.route;
          if (context.mounted) {
            context.go(route);
          }
        }
      });
      return null;
    }, []);

    return const Scaffold(
      body: LoadingIndicator(),
    );
  }
}
