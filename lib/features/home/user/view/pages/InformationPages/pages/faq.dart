import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Faq",
          style: context.typography.bodyLargeSemiBold,
        ),
        centerTitle: true,
        backgroundColor: context.colors.backgroundSubtle,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.space.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.space.space_200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What laundry services do you offer?",
                  style: context.typography.bodyLargeSemiBold,
                ),
                SvgPicture.asset(
                    height: context.space.space_300,
                    Assets.icons.iconArrowDownHomescreen),
                SizedBox(
                  height: context.space.space_800,
                ),
              ],
            ),
            Text(
                "We offer comprehensive laundry services, including wash, dry, and fold options for various garments and linens. Our experienced team ensures top-quality."),
            SizedBox(
              height: context.space.space_200 * 4,
            ),
            FaqQustions(
              txt: "How long does it take to get iron done?",
            ),
            SizedBox(
              height: context.space.space_300,
            ),
            FaqQustions(txt: "Do you offer pickup and delivery?"),
            SizedBox(
              height: context.space.space_300,
            ),
            FaqQustions(txt: "What are you pricing options?"),
            SizedBox(
              height: context.space.space_300,
            ),
            FaqQustions(txt: "How do you ensure the safety laundry?"),
            SizedBox(
              height: context.space.space_300,
            ),
            FaqQustions(txt: "Do you provide eco-friendly optiona?")
          ],
        ),
      ),
    );
  }
}

class FaqQustions extends StatelessWidget {
  final String txt;
  const FaqQustions({
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: context.typography.bodyLargeSemiBold,
        ),
        SvgPicture.asset(Assets.icons.icArrowRightFAQ)
      ],
    );
  }
}
