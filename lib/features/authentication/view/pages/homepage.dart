import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/authentication/controller/auth_logout_controller/auth_logout_controller.dart';

class HomePage extends ConsumerWidget {
  static const String route = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authLogoutControllerProvider);
    return Scaffold(appBar:AppBar(title: const Text("Homepage_user"),centerTitle: true,), 
        body: state.isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: context.colors.primary,
              ))
            : SafeArea(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          ref
                              .read(authLogoutControllerProvider.notifier)
                              .logout();
                        },
                        child: Text("Logout"))
                  ],
                )),
              ));
  }
}
