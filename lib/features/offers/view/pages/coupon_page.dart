import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/offers/view/widgets/coupon_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/elevated_button_widget.dart';

class CoupenPage extends StatelessWidget {
  const CoupenPage({super.key});

  @override
  // Builds the main UI for the CouponPage.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.space.space_200,
              vertical: context.space.space_150),
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: context.space.space_200,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) => const CouponWidget(),
            itemCount: 4,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.space.space_600 * 2),
            child: ElevatedButtonWidget(
              onPressed: () {
                context.pushNamed('addCoupon');
              },
              text: context.l10n.couponHeading,
            ),
          ),
        ),
      ]),
    );
  }
}
