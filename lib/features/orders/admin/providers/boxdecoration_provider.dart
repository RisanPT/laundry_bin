import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'boxdecoration_provider.g.dart';

//provider for boxdecorations of the stepper widget
@riverpod
class BoxdecorationProvider extends _$BoxdecorationProvider {
  @override
  BoxDecoration build() {
    return const BoxDecoration();
  }

//this method provide the decoration of the main circle of the Stepper widget
  BoxDecoration getCirculeBoxDecoration(BuildContext context,
      {bool isCompleted = false, bool isNext = false}) {
    if (isCompleted) {
      return BoxDecoration(
          shape: BoxShape.circle, color: context.colors.primary);
    } else if (isNext) {
      return BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4, color: context.colors.blueOutline));
    } else {
      return BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: context.colors.grey));
    }
  }

//this method provides the decorations of the inner circle of the stepper widget
  BoxDecoration getminiCirculeBoxDecoration(BuildContext context,
      {required bool isCompleted, required bool isNext}) {
    if (isCompleted) {
      return BoxDecoration(color: context.colors.white, shape: BoxShape.circle);
    } else if (isNext) {
      return BoxDecoration(
          color: context.colors.primary, shape: BoxShape.circle);
    } else {
      return BoxDecoration(color: context.colors.grey, shape: BoxShape.circle);
    }
  }

  BoxDecoration getrectangleBoxDecoration(
    BuildContext context, {
    required bool isCompleted,
  }) {
    if (isCompleted) {
      return BoxDecoration(
          color: context.colors.primary, shape: BoxShape.rectangle);
    } else {
      return BoxDecoration(
          color: context.colors.grey, shape: BoxShape.rectangle);
    }
  }
}
