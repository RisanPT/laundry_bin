import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/features/orders/user/controller/washing_provider.dart';

class WashingItems extends ConsumerWidget {
  final String name;
  final int price;
  final Icon icon;

  const WashingItems({
    required this.icon,
    required this.name,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final washingState = ref.watch(washingPro);
    final washingNotifier = ref.read(washingPro.notifier);

    // Get the quantity of the current item
    final quantity = washingState.items[name] ?? 0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            alignment: Alignment.centerLeft,
            child: icon,
          ),
          // Fixed position for the name
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .07),
              alignment: Alignment.centerLeft,
              child: Text(name),
            ),
          ),
          // Fixed position for the price
          Container(
            width: 60,
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * .10),
            alignment: Alignment.center,
            child: Text('₹$price'),
          ),
          // Quantity and add/remove buttons with consistent width
          Container(
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * .01),
            width: MediaQuery.of(context).size.width *
                .3, // Set a fixed width for consistency
            child: quantity == 0
                ? ElevatedButton(
                    onPressed: () {
                      washingNotifier.addItem(name, price);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      // backgroundColor: context.colors.primary,

                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text('+Add'),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline,
                            color: Colors.blueAccent),
                        onPressed: () {
                          washingNotifier.removeItem(name, price);
                        },
                      ),
                      Text(quantity.toString().padLeft(2, '0')),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline,
                            color: Colors.blueAccent),
                        onPressed: () {
                          washingNotifier.addItem(name, price);
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
