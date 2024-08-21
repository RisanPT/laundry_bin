import 'package:flutter/material.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/stepper_widget.dart';

class OrderAcceptPage extends StatelessWidget {
  const OrderAcceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderStepper(),
    );
  }
}