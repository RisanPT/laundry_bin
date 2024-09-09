import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServicesGridViewWidget extends StatelessWidget {
  const ServicesGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(context.space.space_300),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: context.space.space_200,
            mainAxisSpacing: context.space.space_200,
            crossAxisCount: 2),
        itemBuilder: (context, index) => const SevicesContainer());
  }
}

class SevicesContainer extends StatelessWidget {
  const SevicesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.space.space_100 * 18,
      width: context.space.space_100 * 18,
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_200)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.icShirtWashingPage,
              height: context.space.space_700,
              width: context.space.space_700,
            ),
            SizedBox(
              height: context.space.space_150,
            ),
            Text(
              "Shirt",
              style: context.typography.bodySmallSemiBold,
            )
          ],
        ),
      ),
    );
  }
}
