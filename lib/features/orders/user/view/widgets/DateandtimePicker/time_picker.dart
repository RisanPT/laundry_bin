import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class TimePicker extends HookWidget {
  final TextEditingController? controller;
  const TimePicker({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    final selectedTime = useState<TimeOfDay?>(null);

    Future<void> selectTime() async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime.value ?? TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != selectedTime.value) {
        selectedTime.value = pickedTime;

        final formattedTime = pickedTime.format(context);
        controller.text = formattedTime;
      }
    }

    return SizedBox(
      width: context.space.space_400 * 5,
      height: context.space.space_200 * 3,
      child: TextField(
        controller: controller, // Make sure controller is passed here
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: context.colors.grey,
              width: 2.0,
            ),
          ),
          fillColor: context.colors.white,
          hintText: 'Slot',
          hintStyle: context.typography.bodySmall.copyWith(
            color: context.colors.hintTxt,
          ),
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              Assets.icons.icClockSlot,
              colorFilter: ColorFilter.mode(
                context.colors.primary,
                BlendMode.srcIn,
              ),
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
            horizontal: context.space.space_250,
          ),
        ),
        readOnly: true,
        onTap: () {
          selectTime();
        },
      ),
    );
  }
}
