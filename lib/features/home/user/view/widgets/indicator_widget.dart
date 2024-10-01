import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class IndicatorWidget extends HookWidget {
  final int currentPage;

  const IndicatorWidget({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
              margin: const EdgeInsets.all(2),
              height: context.space.space_100,
              width: context.space.space_100,
              decoration: currentPage == i
                  ? BoxDecoration(
                      color: context.colors.primary, shape: BoxShape.circle)
                  : BoxDecoration(
                      border: Border.all(
                          color: context.colors.secondaryTxt, width: 1.5),
                      shape: BoxShape.circle)),
      ],
    );
  }
}
