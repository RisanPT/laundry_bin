import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.space.space_500 * 2,
      width: double.infinity,
      color: context.colors.profileBg,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.backgroundSubtle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.space.space_500),
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.space.space_500),
              bottomRight: Radius.circular(context.space.space_500),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Action(
                asset: Assets.images.imgShirtProfilePage,
                label: context.l10n.history,
              ),
              _Action(
                asset: Assets.icons.icContactUsProfilePage,
                label: context.l10n.contactUs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final String asset;
  final String label;

  const _Action({required this.asset, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: context.space.space_700 * 3,
        height: context.space.space_700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.space.space_800),
          color: context.colors.background,
        ),
        child: Row(
          children: [
            SizedBox(width: context.space.space_100),
            SvgPicture.asset(asset),
            SizedBox(width: context.space.space_100),
            Text(
              label,
              style: context.typography.bodyLarge
                  .copyWith(color: context.colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
