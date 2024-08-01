import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/dashed_line_widget.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/ordered_items_card.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/ordered_user_card_widget.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/stepper_widget.dart';

class OrdersDetailsPage extends StatelessWidget {
  const OrdersDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.space.space_200,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.space.space_200),
                child: Row(
                  children: [
                    Text(
                      "New Orders",
                      style: context.typography.h3,
                    ),
                    const Expanded(child: SizedBox()),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: context.space.space_25,
                                color: context.colors.warning)),
                        onPressed: () {},
                        child: Text(
                          "Reject",
                          style: context.typography.bodySemiBold
                              .copyWith(color: context.colors.warning),
                        ))
                  ],
                ),
              ),
              const OrderedUserCardWidget(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.space.space_200),
                child: const Divider(),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.space.space_200),
                child: Text(
                  "Items Ordered",
                  style: context.typography.bodySemiBold,
                ),
              ),
              ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const OrderedItemsCard(),
                separatorBuilder: (context, index) =>
                    DashedLineWidget(color: context.colors.grey),
              ),
              StepperWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
