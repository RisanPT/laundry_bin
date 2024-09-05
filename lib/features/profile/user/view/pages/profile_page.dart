import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/authentication/controller/auth_logout_controller/auth_logout_controller.dart';
import 'package:laundry_bin/features/profile/user/view/widgets/profiledetails/profile_actions.dart';
import 'package:laundry_bin/features/profile/user/view/widgets/profiledetails/profile_header.dart';
import 'package:laundry_bin/features/profile/user/view/widgets/profiledetails/profile_info.dart';
import 'package:laundry_bin/features/profile/user/view/widgets/profiledetails/profile_options_list.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: context.colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              const ProfileInfo(),
              const ProfileActions(),
              const ProfileOptionsList(),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(authLogoutControllerProvider.notifier).logout();
                  },
                  child: const Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
