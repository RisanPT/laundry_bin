import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class TimePicker extends HookWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTime = useState<TimeOfDay?>(null);
    final textController = useTextEditingController();

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime.value ?? TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != selectedTime.value) {
        selectedTime.value = pickedTime;
        textController.text = selectedTime.value!.format(context);
      }
    }

    return Container(
      width: context.space.space_400 * 5,
      height: context.space.space_200 * 3,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          fillColor: context.colors.white,
          labelText: AppLocalizations.of(context)!.slot,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(Assets.icons.icClockSlot),
          ),
          focusedBorder: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () {
          _selectTime(context);
        },
      ),
    );
  }
}
