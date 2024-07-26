import 'package:flutter/material.dart';

import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/profile/user/view/pages/profiledetails/profile_actions.dart';
import 'package:laundry_bin/features/profile/user/view/pages/profiledetails/profile_header.dart';
import 'package:laundry_bin/features/profile/user/view/pages/profiledetails/profile_info.dart';
import 'package:laundry_bin/features/profile/user/view/pages/profiledetails/profile_options_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              ProfileInfo(),
              ProfileActions(),
              ProfileOptionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
