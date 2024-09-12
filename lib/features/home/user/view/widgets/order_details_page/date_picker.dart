import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class DatePickerOne extends HookWidget {
  const DatePickerOne({super.key});

  @override
  Widget build(BuildContext context) {
    final _selectedDate = useState<DateTime>(DateTime.now());
    final _selectedTime = useState<TimeOfDay>(TimeOfDay.now());

    // Function to pick a date
    Future<void> _pickDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null && pickedDate != _selectedDate.value) {
        _selectedDate.value = pickedDate;
      }
    }

    // Function to pick a time
    Future<void> _pickTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime.value,
      );
      if (pickedTime != null && pickedTime != _selectedTime.value) {
        _selectedTime.value = pickedTime;
      }
    }

    // Format Date
    String _formatDate(DateTime date) {
      return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().substring(2)}";
    }

    // Format Time
    String _formatTime(TimeOfDay time) {
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
          onTap: () => _pickDate(context),
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.blueGrey),
              SizedBox(width: 10),
              Text(
                _formatDate(_selectedDate.value),
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        SizedBox(width: context.space.space_200),

        InkWell(
          onTap: () => _pickTime(context),
          child: Row(
            children: [
              Icon(Icons.access_time, color: Colors.blueGrey),
              SizedBox(width: 10),
              Text(
                _formatTime(_selectedTime.value),
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
