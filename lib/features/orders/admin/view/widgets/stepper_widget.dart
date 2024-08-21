import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OrderStepper extends ConsumerWidget {
  const OrderStepper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(currentStepProvider);

    return Stepper(
      connectorColor: WidgetStatePropertyAll(context.colors.primary),
      currentStep: currentStep,
      onStepContinue: currentStep < 4
          ? () => ref.read(currentStepProvider.notifier).state++
          : null,
      onStepCancel: currentStep > 0
          ? () => ref.read(currentStepProvider.notifier).state--
          : null,
      steps: [
        Step(
          title: Text(
            'Order Accepted',
            style: context.typography.bodyLarge
                .copyWith(color: context.colors.btnShadow),
          ),
          content: Padding(
            padding: EdgeInsets.all(context.space.space_100),
            child: Text('Order accepted at April 2023 12:00 AM',
                style: context.typography.body
                    .copyWith(color: context.colors.btnShadow)),
          ),
          isActive: currentStep >= 0,
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Order Processing',
              style: context.typography.bodyLarge
                  .copyWith(color: context.colors.btnShadow)),
          content: Padding(
            padding: EdgeInsets.all(context.space.space_100),
            child: Text('Order Processing at April 2023 12:00 AM',
                style: context.typography.body
                    .copyWith(color: context.colors.btnShadow)),
          ),
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Pick Up',
              style: context.typography.bodyLarge
                  .copyWith(color: context.colors.btnShadow)),
          content: Padding(
            padding: EdgeInsets.all(context.space.space_100),
            child: Text('Pick Up order at April 2023 12:00 AM',
                style: context.typography.body
                    .copyWith(color: context.colors.btnShadow)),
          ),
          isActive: currentStep >= 2,
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Out For Delivery',
              style: context.typography.bodyLarge
                  .copyWith(color: context.colors.btnShadow)),
          content: Padding(
            padding: EdgeInsets.all(context.space.space_100),
            child: Text('Out For Delivery at April 2023 12:00 AM',
                style: context.typography.body
                    .copyWith(color: context.colors.btnShadow)),
          ),
          isActive: currentStep >= 3,
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Completed',
              style: context.typography.bodyLarge
                  .copyWith(color: context.colors.btnShadow)),
          content: Padding(
            padding: EdgeInsets.all(context.space.space_100),
            child: Text('Order Completed at April 2023 12:00 AM',
                style: context.typography.body
                    .copyWith(color: context.colors.btnShadow)),
          ),
          isActive: currentStep >= 4,
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
        ),
      ],
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: details.onStepContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
              ),
              child: Text(
                'Continue',
                style: TextStyle(color: context.colors.white),
              ),
            ),
            TextButton(
              onPressed: details.onStepCancel,
              child: Text(
                'Cancel',
                style: TextStyle(color: context.colors.btnShadow),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Define the current step state provider
final currentStepProvider = StateProvider<int>((ref) {
  return 0; // Start at the first step
});
