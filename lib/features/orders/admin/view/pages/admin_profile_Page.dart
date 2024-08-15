import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/authentication/controller/auth_logout_controller/auth_logout_controller.dart';

class AdminProfilePage extends ConsumerWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Admin Profile Page"),
            SizedBox(
              height: context.space.space_200,
            ),
            ElevatedButton(
                onPressed: () async {
                  ref.read(authLogoutControllerProvider.notifier).logout();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
