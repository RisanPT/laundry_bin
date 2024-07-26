import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.space.space_600 * 2,
      width: double.infinity,
      color: context.colors.profileBg,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Assets.images.profileBgImage,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.space.space_250,
              top: context.space.space_500,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                context.l10n.profile,
                style: context.typography.h2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
