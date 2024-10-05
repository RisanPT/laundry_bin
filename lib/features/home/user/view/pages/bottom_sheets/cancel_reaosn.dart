import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/pages/bottom_sheets/booking_cancelled.dart';
import 'package:laundry_bin/features/home/user/view/pages/bottom_sheets/feedback_bottomsheet.dart';

class CancelReaosn extends HookWidget {
  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Makes the bottom sheet full screen when necessary
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return const BookingCancelled();
      },
    );
  }

  const CancelReaosn({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState(1);
    return Container(
      height: context.space.space_900 * 11,
      width: double.infinity,
      decoration: BoxDecoration(
          color: context.colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.all(context.space.space_100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.space.space_100 * 43,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            Text(
              " Tell us \n your reason for \n cancelling",
              style: context.typography.h1,
            ),
            SizedBox(
              height: context.space.space_100,
            ),
            Column(
              children: [
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 1,
                  txt: "Change in plans",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 2,
                  txt: "Emergencies",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 3,
                  txt: "Travel Plans",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 4,
                  txt: "Budget Constraints",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 5,
                  txt: "Unsatisfactory Service Experience",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 6,
                  txt: "Availability of Alternatives",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 7,
                  txt: "Personal Health Issues",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 8,
                  txt: "Quality Concerns",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 9,
                  txt: "Change in Laundry Volume",
                ),
                RadioButtonWidget(
                  selectedValue: selectedValue,
                  value: 10,
                  txt: "Others",
                ),
              ],
            ),
            SizedBox(
              height: context.space.space_200,
            ),
            ButtonContainer(
              txt: "Submit",
              onTap: () {
                _showFeedbackBottomSheet(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class RadioButtonWidget extends StatelessWidget {
  final int value;
  final String txt;
  const RadioButtonWidget(
      {super.key,
      required this.selectedValue,
      required this.txt,
      required this.value});

  final ValueNotifier<int> selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            activeColor: context.colors.primary,
            value: value,
            groupValue: selectedValue.value,
            onChanged: (int? value) {
              selectedValue.value = value!;
            }),
        Text(
          txt,
          style: context.typography.bodyLargeSemiBold,
        )
      ],
    );
  }
}
