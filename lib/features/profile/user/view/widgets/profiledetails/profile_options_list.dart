import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      _OptionData(Assets.icons.icDashboardProfilePage, context.l10n.dashboard),
      _OptionData(Assets.icons.icAddressProfilePage, context.l10n.address),
      _OptionData(Assets.icons.icFAQProfilePage, context.l10n.faq),
      _OptionData(Assets.icons.icAboutusProfilePage, context.l10n.aboutUs),
      _OptionData(Assets.icons.icReviewProfilePage, context.l10n.reviews),
      _OptionData(
          Assets.icons.icPrivacyPolicyProfilePage, context.l10n.privacyPolicy),
    ];

    return Container(
      width: double.infinity,
      color: context.colors.white,
      child: Container(
        width: double.infinity,
        height: context.space.space_800 * 7,
        decoration: BoxDecoration(
          color: context.colors.backgroundSubtle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.space.space_500)),
        ),
        child: Column(
          children: [
            SizedBox(height: context.space.space_300), // Added SizedBox here
            ...options
                .map((option) => [
                      _OptionItem(option: option),
                      SizedBox(
                          height:
                              context.space.space_200), // Added SizedBox here
                    ])
                .toList()
                .expand((element) => element),
          ],
        ),
      ),
    );
  }
}

class _OptionItem extends StatelessWidget {
  final _OptionData option;

  const _OptionItem({required this.option});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: double.infinity,
        height: context.space.space_500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: context.space.space_300),
                SvgPicture.asset(option.icon),
                SizedBox(width: context.space.space_300),
                Text(
                  option.label,
                  style: context.typography.bodyLargeMedium
                      .copyWith(color: context.colors.primaryTxt),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: context.space.space_100),
              child: SvgPicture.asset(Assets.icons.icArrowRightFAQ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionData {
  final String icon;
  final String label;

  _OptionData(this.icon, this.label);
}
