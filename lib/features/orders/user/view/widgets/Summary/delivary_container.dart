import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/DateandtimePicker/datepicker.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/DateandtimePicker/time_picker.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class DeliveryOptions extends HookWidget {
  const DeliveryOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpressDelivery = useState(false);
    final selectedDeliveryOption = useState(0);

    return Card(
      color: context.colors.white,
      child: Padding(
        padding: EdgeInsets.all(context.space.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.delivery,
              style: TextStyle(
                color: context.colors.primary,
              ),
            ),
            SizedBox(height: context.space.space_150),
            ListTile(
              title: const Text(
                  '19 Cross, between Hufuf and, Khobar\n676552, India | +91 8415698625'),
              leading: Radio<int>(
                activeColor: context.colors.primary,
                value: 0,
                groupValue: selectedDeliveryOption.value,
                onChanged: (value) {
                  selectedDeliveryOption.value = value!;
                },
              ),
            ),
            ListTile(
              title: const Text('Collect from store'),
              leading: Radio<int>(
                activeColor: context.colors.primary,
                value: 1,
                groupValue: selectedDeliveryOption.value,
                onChanged: (value) {
                  selectedDeliveryOption.value = value!;
                },
              ),
            ),
            SizedBox(height: context.space.space_150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Express Delivery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  activeTrackColor: context.colors.primary,
                  value: isExpressDelivery.value,
                  onChanged: (value) {
                    isExpressDelivery.value = value;
                  },
                ),
              ],
            ),
            SizedBox(height: context.space.space_150),
            Row(
              children: [
                const Expanded(
                  child: DatePicker(),
                ),
                SizedBox(width: context.space.space_150),
                const Expanded(child: TimePicker()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
