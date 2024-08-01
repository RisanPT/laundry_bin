import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OrderTotalPriceCardWidget extends StatelessWidget {
  const OrderTotalPriceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colors.priceContainer),
      height: 300,
      width: double.infinity,
      child: const Column(
        children: [
          Row(
            children: [
              Text("Item Price"),
              Text("\$300"),
            ],
          ),
          Row(
            children: [
              Text("Delivery Charge"),
              Text("\$50"),
            ],
          ),
          Row(
            children: [
              Text("Total Price"),
              Text("\$350"),
            ],
          ),
        ],
      ),
    );
  }
}
