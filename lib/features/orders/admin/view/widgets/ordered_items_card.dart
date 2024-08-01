import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OrderedItemsCard extends StatelessWidget {
  const OrderedItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        context.space.space_200,
      ),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: context.space.space_700,
                  width: context.space.space_700,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.space.space_300),
                      color: context.colors.grey),
                ),
                SizedBox(
                  width: context.space.space_200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shirt",
                      style: context.typography.h3,
                    ),
                    Text("washing", style: context.typography.subtitle),
                  ],
                )
              ],
            ),
            SizedBox(
              height: context.space.space_300,
            ),
            Row(
              children: [
                SizedBox(
                  width: context.space.space_900,
                ),
                Text(
                  "service price",
                  style: context.typography.bodySmall
                      .copyWith(color: context.colors.hintTxt),
                ),
                const Expanded(child: SizedBox()),
                Text("\$20.00",
                    style: context.typography.bodySmall
                        .copyWith(color: context.colors.hintTxt))
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: context.space.space_900,
                ),
                Text(
                  "cold water",
                  style: context.typography.bodySmall
                      .copyWith(color: context.colors.hintTxt),
                ),
                const Expanded(child: SizedBox()),
                Text("\$10.00",
                    style: context.typography.bodySmall
                        .copyWith(color: context.colors.hintTxt)),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: context.space.space_900,
                ),
                Text(
                  "perfume",
                  style: context.typography.bodySmall
                      .copyWith(color: context.colors.hintTxt),
                ),
                const Expanded(child: SizedBox()),
                Text("\$20.00",
                    style: context.typography.bodySmall
                        .copyWith(color: context.colors.hintTxt)),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: context.space.space_900,
                ),
                Text(
                  "x2",
                  style: context.typography.bodySmallSemiBold,
                ),
                const Expanded(child: SizedBox()),
                Text("\$100.00", style: context.typography.bodySmallSemiBold)
              ],
            )
          ],
        ),
      ),
    );
  }
}
