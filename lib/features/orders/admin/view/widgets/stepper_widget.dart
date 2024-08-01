import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/step_widget.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
      child: const Column(
        children: [
          StepWidget(
            isCompleted: true,
          ),
          StepWidget(
            isNext: true,
          ),
          StepWidget(),
          StepWidget(),
          StepWidget(
            isLast: true,
          ),
        ],
      ),
    );
  }
}
