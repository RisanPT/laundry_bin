import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/admin/providers/boxdecoration_provider.dart';

class StepWidget extends ConsumerWidget {
  final bool isLast;
  final bool isCompleted;
  final bool isNext;
  const StepWidget({
    super.key,
    this.isLast = false,
    this.isCompleted = false,
    this.isNext = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxdecoration = ref.watch(boxdecorationProviderProvider.notifier);
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        children: [
          Container(
            height: context.space.space_500,
            width: context.space.space_500,
            decoration: boxdecoration.getCirculeBoxDecoration(context,
                isCompleted: isCompleted, isNext: isNext),
            child: Center(
              // This centers the child within the parent
              child: Container(
                height: context.space.space_150,
                width: context.space.space_150,
                decoration: boxdecoration.getminiCirculeBoxDecoration(context,
                    isCompleted: isCompleted, isNext: isNext),
              ),
            ),
          ),
          isLast
              ? const SizedBox()
              : Container(
                  height: 100,
                  width: 3,
                  decoration: boxdecoration.getrectangleBoxDecoration(context,
                      isCompleted: isCompleted)),
        ],
      ),
      SizedBox(
        width: context.space.space_200,
      ),
      Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: context.colors.grey),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Accepted",
                  style: context.typography.h3.copyWith(fontSize: 16),
                ),
                Text(
                  'jnfjnaf kjfnsnc jsbfsb hfhgf hhdhsbcs f sfsfs fs fsfsf sfsfs sf sfhusfhsbfs jhfshf hbsfdhbs hjvef.', // Truncate the text with ellipsis if it overflows
                  maxLines: 2, // Maximum number of lines the text can occupy
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: context.space.space_50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("completed"),
                  style: ButtonStyle(
                      foregroundColor:
                          WidgetStatePropertyAll<Color>(context.colors.white),
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(context.colors.green),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
