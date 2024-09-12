import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ReceiptCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.space.space_150),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Receipt',
              style: context.typography.h3
                  .copyWith(color: context.colors.primary)),
          SizedBox(height: context.space.space_150),
          const ReceiptItem(
            itemName: 'Shirt    ',
            quantity: 'x2',
            price: '₹40',
          ),
          const ReceiptItem(
            itemName: 'T-Shirt',
            quantity: 'x2',
            price: '₹40',
          ),
          const ReceiptItem(
            itemName: 'Shorts',
            quantity: 'x1',
            price: '₹40',
          ),
          const Divider(),
          const ReceiptItem(
            itemName: 'Delivery Charge',
            quantity: '',
            price: '₹50',
          ),
          const ReceiptItem(
            itemName: 'Tax',
            quantity: '',
            price: '₹50',
          ),
          ReceiptItem(
            itemName: 'Coupon Reduction',
            quantity: '',
            price: '₹50',
            priceColor: context.colors.green,
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '₹110',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReceiptItem extends StatelessWidget {
  final String itemName;
  final String quantity;
  final String price;
  final Color priceColor;

  const ReceiptItem({
    required this.itemName,
    required this.quantity,
    required this.price,
    this.priceColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$itemName',
            style: context.typography.bodyLarge.copyWith(color: priceColor),
          ),
          Text(quantity),
          Text(price,
              style: context.typography.bodyLarge.copyWith(color: priceColor)),
        ],
      ),
    );
  }
}
