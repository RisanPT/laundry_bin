import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OrderDropdown extends HookWidget {
  const OrderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> orderOptions = ['All Orders', 'Pending', 'Completed'];

    final selectedOrder = useState(orderOptions[0]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.space.space_100),
      decoration: BoxDecoration(
        color: context.colors.white, // Adjust color to match the image
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        value: selectedOrder.value,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.blueGrey),
        elevation: 16,
        style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
        underline: const SizedBox(), // Remove the default underline
        onChanged: (String? newValue) {
          selectedOrder.value = newValue!;
        },
        items: orderOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
