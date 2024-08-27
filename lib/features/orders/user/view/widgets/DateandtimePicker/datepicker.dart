import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/DateandtimePicker/time_picker.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class DatePickerPage extends StatelessWidget {
  const DatePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.space.space_150),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(context.space.space_100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.pickUp,
            style: context.typography.bodyLarge
                .copyWith(color: context.colors.primary),
          ),
          SizedBox(
            height: context.space.space_200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DatePicker(),
              TimePicker(),
            ],
          ),
        ],
      ),
    );
  }
}

class DatePicker extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedDate = useState<DateTime?>(null);
    final textController = useTextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        initialDate: selectedDate.value ?? DateTime.now(),
        lastDate: DateTime(2024).add(Duration(days: 365)),
      );

      if (pickedDate != null && pickedDate != selectedDate.value) {
        selectedDate.value = pickedDate;
        textController.text = '${selectedDate.value!.toLocal()}'.split(' ')[0];
      }
    }

    return Container(
      width: context.space.space_400 * 5,
      height: context.space.space_200 * 3,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          labelText: AppLocalizations.of(context)!.dateFormat,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              Assets.icons.icCalendarDOB,
            ),
          ),
          focusedBorder: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }
}
