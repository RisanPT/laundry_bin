import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class DatePickerOne extends HookWidget {
  const DatePickerOne({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState<DateTime>(DateTime.now());
    final selectedTime = useState<TimeOfDay>(TimeOfDay.now());

    // Function to pick a date
    Future<void> pickDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null && pickedDate != selectedDate.value) {
        selectedDate.value = pickedDate;
      }
    }

    // Function to pick a time
    Future<void> pickTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime.value,
      );
      if (pickedTime != null && pickedTime != selectedTime.value) {
        selectedTime.value = pickedTime;
      }
    }

    // Format Date
    String formatDate(DateTime date) {
      return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().substring(2)}";
    }

    // Format Time
    String formatTime(TimeOfDay time) {
      final hour = time.hourOfPeriod.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      final period = time.period == DayPeriod.am ? "AM" : "PM";
      return "$hour:$minute $period";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Date Picker Button
        InkWell(
          onTap: () => pickDate(context),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.blueGrey),
              const SizedBox(width: 10),
              Text(
                formatDate(selectedDate.value),
                style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        SizedBox(width: context.space.space_200),

        InkWell(
          onTap: () => pickTime(context),
          child: Row(
            children: [
              const Icon(Icons.access_time, color: Colors.blueGrey),
              const SizedBox(width: 10),
              Text(
                formatTime(selectedTime.value),
                style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
