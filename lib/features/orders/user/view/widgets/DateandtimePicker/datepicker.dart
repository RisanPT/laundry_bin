import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart'; // Add this import
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
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
              const DatePicker(),
              TimePicker(),
            ],
          ),
        ],
      ),
    );
  }
}

class DatePicker extends HookWidget {
  final TextEditingController? controller;
  const DatePicker({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    final selectedDate = useState<DateTime?>(null);

    Future<void> selectDate() async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        initialDate: selectedDate.value ?? DateTime.now(),
        lastDate: DateTime(2024).add(const Duration(days: 365)),
      );

      if (pickedDate != null && pickedDate != selectedDate.value) {
        selectedDate.value = pickedDate;
        final formattedDate =
            DateFormat("dd-MM-yyyy").format(selectedDate.value!);
        controller.text = formattedDate;
      }
    }

    return SizedBox(
      width: context.space.space_400 * 5,
      height: context.space.space_200 * 3,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: context.colors.grey,
              width: 2.0,
            ),
          ),
          fillColor: context.colors.white,
          hintText: context.l10n.dateFormat,
          hintStyle: context.typography.bodySmall
              .copyWith(color: context.colors.hintTxt),
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              Assets.icons.icCalendarDOB,
              colorFilter:
                  ColorFilter.mode(context.colors.primary, BlendMode.srcIn),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: context.colors.grey,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: context.colors.primary,
              width: 2.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: context.space.space_100,
              horizontal: context.space.space_250),
        ),
        readOnly: true,
        onTap: () {
          selectDate();
        },
      ),
    );
  }
}
