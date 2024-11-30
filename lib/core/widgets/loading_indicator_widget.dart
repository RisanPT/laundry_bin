import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          child: Lottie.asset(Assets.animations.inidicatorAnimated,
              height: context.space.space_600 * 2,
              width: context.space.space_600 * 2)),
    );
  }
}
