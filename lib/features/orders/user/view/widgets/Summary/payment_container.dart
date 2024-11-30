import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 300,
      width: double.infinity,
      // color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.paymentMethod,
            style: context.typography.bodySemiBold,
          ),
          SizedBox(
            height: context.space.space_100,
          ),
          PaymentMethod(
            txt: AppLocalizations.of(context)!.cod,
            clr1: const Color(0xFFd6f7fa),
            svg1: Assets.icons.icEmptyWalletCOD,
            svg2: Assets.icons.circle,
          ),
          SizedBox(
            height: context.space.space_150,
          ),
          PaymentMethod(
              txt: AppLocalizations.of(context)!.upi,
              clr1: const Color(0xFFfdecd2),
              svg1: Assets.icons.icUpi,
              svg2: Assets.icons.icArrowRightFAQ)
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final Color clr1;
  final String txt;
  final String svg1;
  final String svg2;

  const PaymentMethod(
      {super.key,
      required this.clr1,
      required this.svg1,
      required this.svg2,
      required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.space.space_900,
      decoration: BoxDecoration(
          color: context.colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(context.space.space_50),
                child: Container(
                  width: context.space.space_900,
                  height: context.space.space_900,
                  decoration: BoxDecoration(
                      color: clr1,
                      borderRadius:
                          BorderRadius.circular(context.space.space_100)),
                  child: Center(
                    child: SvgPicture.asset(
                      height: context.space.space_500,
                      width: context.space.space_500,
                      svg1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.space.space_100,
              ),
              Text(
                txt,
                style: context.typography.bodyLargeSemiBold,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(context.space.space_100),
            child: SvgPicture.asset(svg2),
          )
        ],
      ),
    );
  }
}
