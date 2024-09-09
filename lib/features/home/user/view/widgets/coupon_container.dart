import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/home/user/model/user_offers_model.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class CouponContainer extends StatelessWidget {
  final List<UserOffersModel> offers = [
    UserOffersModel(
        discription: "Try our service at no cost—your first order is on us!",
        clickBiteText: "First Wash Free!"),
    UserOffersModel(
        discription: "Get 10% off on your next order!",
        clickBiteText: "10% OFF"),
    UserOffersModel(
        discription:
            "Get unlimited laundry services for just \$29.99 per month.",
        clickBiteText: "\$29.99"),
    UserOffersModel(
        discription: "Get free delivery on every order!",
        clickBiteText: "Free Delivery"),
  ];
  CouponContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.space.space_200,
      ),
      child: Container(
        width: double.infinity,
        height: 155,
        decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(context.space.space_200)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: context.space.space_200, left: context.space.space_200),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.icons.iconOfferTagHomescreen),
                  SizedBox(
                    width: context.space.space_50,
                  ),
                  Text(
                    context.l10n.offer,
                    style: context.typography.bodyLargeSemiBold.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.space.space_200, vertical: 8),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          height: 80,
                          width: 242,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.colors.backgroundSubtle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  offers[index].discription,
                                  style: context.typography.bodySmallSemiBold,
                                ),
                                Text(
                                  offers[index].clickBiteText.toString(),
                                  style: context.typography.bodyLargeSemiBold,
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    shrinkWrap: true,
                    itemCount: offers.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
