import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class DropDownButtonWidget extends HookWidget {
  final String item1;
  final String item2;
  final String? item3;

  const DropDownButtonWidget({
    super.key,
    required this.item1,
    required this.item2,
    this.item3,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<String?>(null);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(context.space.space_50),
            boxShadow: [context.shadow.offerContainerShadow],
          ),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            hint: const Text("Select an option"),
            value: selectedValue.value,
            items:
                [item1, item2, if (item3 != null) item3!].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              selectedValue.value = newValue;
            },
          ),
        ),
      ],
    );
  }
}
