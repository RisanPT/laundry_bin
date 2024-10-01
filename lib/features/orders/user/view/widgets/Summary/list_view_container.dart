import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_150)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.space.space_200),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.iconOfferTagHomescreen),
                SizedBox(
                  width: context.space.space_100,
                ),
                Text(
                  AppLocalizations.of(context)!.offer,
                  style: context.typography.bodyLargeSemiBold
                      .copyWith(color: context.colors.primary),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                OfferText(
                  txt1: AppLocalizations.of(context)!.offerFor(6),
                  txt2: '499',
                ),
                OfferText(
                    txt1: AppLocalizations.of(context)!.offerFor(7),
                    txt2: '599'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OfferText extends StatelessWidget {
  String txt1;
  String txt2;
  OfferText({super.key, required this.txt1, required this.txt2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.space.space_200,
          vertical: context.space.space_150),
      child: Container(
        // height: context.space.space_300 * 9,
        // width: 100,
        decoration: BoxDecoration(
            color: context.colors.backgroundSubtle,
            borderRadius: BorderRadius.circular(context.space.space_150)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.space.space_100),
                child: Text(
                  txt1,
                  style: context.typography.bodySemiBold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.space.space_100),
                child: Text(
                  txt2,
                  style: context.typography.h2
                      .copyWith(color: context.colors.hintTxt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
