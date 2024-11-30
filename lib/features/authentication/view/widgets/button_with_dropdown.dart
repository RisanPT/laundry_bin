import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ElevatedDropdownButton extends HookWidget {
  final List<String> items;
  final String initialValue;
  final ValueChanged<String?> onChanged;

  const ElevatedDropdownButton({
    super.key,
    required this.items,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<String>(initialValue);

    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, context.space.space_100),
        backgroundColor: context.colors.green,
        foregroundColor: context.colors.green,
        padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
      ),
      child: DropdownButton<String>(
        value: selectedValue.value,
        onChanged: (String? newValue) {
          selectedValue.value = newValue!;
          onChanged(newValue);
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        underline: const SizedBox(),
        dropdownColor: context.colors.white,
        iconEnabledColor: context.colors.primaryTxt,
        iconSize: context.space.space_300,
        style:
            context.typography.body.copyWith(color: context.colors.primaryTxt),
      ),
    );
  }
}
