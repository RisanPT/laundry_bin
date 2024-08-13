import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(" Profile "),
            CircleAvatar(
              radius: 70,
              backgroundColor: context.colors.white,
              child: CircleAvatar(
                backgroundColor: context.colors.backgroundSubtle,
                radius: 35,
                child: SvgPicture.asset(Assets.icons.iconUserHomescreen),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Row(children: [
                  Icon(Icons.edit),
                  Text("Edit Profile"),
                ]))
          ],
        ),
      ),
    );
  }
}
