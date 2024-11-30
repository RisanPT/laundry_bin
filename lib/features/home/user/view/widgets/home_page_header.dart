import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class HomePageHeader extends ConsumerWidget {
  //intergate username and address from the database
  final User? userName = FirebaseAuth.instance.currentUser;
  final String? userAddress = "Palazhi,Calicut";
  HomePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      

    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: FractionalOffset.centerLeft,
              child: Column(
                children: [
                  SizedBox(
                    height: context.space.space_600,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: context.space.space_200),
                    child: Text(
                      '${context.l10n.homeHeading}\n${userName!.displayName}',
                      style: context.typography.h1,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                Assets.images.homeBgImageSvg,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: context.space.space_200),
          child: Row(children: [
            SvgPicture.asset(Assets.icons.iconHomescreenHouse),
            SizedBox(
              width: context.space.space_50,
            ),
            Text(
              userAddress.toString(),
              style: context.typography.subtitle,
            ),
          ]),
        ),
      ],
    );
  }
}
