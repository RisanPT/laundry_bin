// import 'package:flutter/material.dart';
// import 'package:laundry_bin/core/extension/theme_extension.dart';

// class OrdersDetailsPage extends StatelessWidget {
//   const OrdersDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.colors.backgroundSubtle,
//       body: Column(
//         children: [
//           SizedBox(
//             height: context.space.space_600,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: context.space.space_150,
//               ),
//               Text(
//                 "New Order",
//                 style: context.typography.h3,
//               ),
//               Expanded(child: SizedBox()),
//               OutlinedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Reject",
//                     style: context.typography.buttonTxt
//                         .copyWith(color: context.colors.warning),
//                   )),
//             ],
//           ),
//           Text(
//             "heyyyy",
//             style: TextStyle(color: context.colors.green),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrderTimelinePage extends HookConsumerWidget {
  const OrderTimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderStatus = ref.watch(orderStatusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Timeline'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: orderStatus
              .map((status) => OrderStatusWidget(status: status))
              .toList(),
        ),
      ),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: status.isCompleted ? Colors.green : Colors.blue,
                ),
              ),
              Container(
                height: 80,
                width: 2,
                color: status.isCompleted ? Colors.green : Colors.blue,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(status.description),
                  if (status.isCompleted)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Completed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final orderStatusProvider = StateProvider<List<OrderStatus>>((ref) => [
      OrderStatus(
          title: "Order accepted",
          description: "#12345 order accepted at April 2023 12:00 AM"),
      OrderStatus(
          title: "Order Processing",
          description: "#12345 order accepted at April 2023 12:00 AM"),
      OrderStatus(
          title: "Pick Up",
          description: "#12345 order accepted at April 2023 12:00 AM",
          isCompleted: true),
      OrderStatus(
          title: "Out For Delivery",
          description: "#12345 order accepted at April 2023 12:00 AM"),
      OrderStatus(
          title: "Completed",
          description: "#12345 order accepted at April 2023 12:00 AM"),
    ]);

class OrderStatus {
  final String title;
  final String description;
  final bool isCompleted;

  OrderStatus(
      {required this.title,
      required this.description,
      this.isCompleted = false});
}
