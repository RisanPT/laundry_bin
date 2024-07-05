import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

import 'package:laundry_bin/features/orders/admin/view/widgets/orders_containers_widget.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/orders_textfield_widget.dart';

class AllOrdersPage extends HookConsumerWidget {
  AllOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: context.colors.white,
          appBar: AppBar(
            title: Text(
              "Orders",
              style: TextStyle(color: context.colors.primaryTxt),
            ),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: context.colors.primary,
                indicatorColor: context.colors.primary,
                labelStyle: context.typography.bodySemiBold,
                unselectedLabelStyle: context.typography.bodySmallSemiBold,
                tabs: [
                  Tab(
                    child: Text(
                      "New",
                    ),
                  ),
                  Tab(
                    text: "In Progress",
                  ),
                  Tab(
                    child: Text(
                      "Ready",
                    ),
                  ),
                  Tab(
                    text: "History",
                  ),
                ]),
          ),
          body: TabBarView(children: [
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: context.space.space_100,
              ),
              itemBuilder: (context, index) => OrdersContainersWidget(
                date: "Apr 01 2024",
                time: "10:34 AM",
                userName: "Salih",
                orderId: "#34567",
                itemCount: 3,
                price: 550,
              ),
              itemCount: 2,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: context.space.space_100,
              ),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) => OrdersContainersWidget(
                date: "Apr 01 2024",
                time: "10:34 AM",
                userName: "Risan PT",
                orderId: "#34567",
                itemCount: 3,
                price: 340,
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: context.space.space_100,
              ),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) => OrdersContainersWidget(
                date: "Apr 01 2024",
                time: "10:34 AM",
                userName: "Iyas",
                orderId: "#34567",
                itemCount: 3,
                price: 340,
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: context.space.space_100,
              ),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) => OrdersContainersWidget(
                date: "Apr 01 2024",
                time: "10:34 AM",
                userName: "Risan PT",
                orderId: "#34567",
                itemCount: 3,
                price: 340,
              ),
            ),
          ])),
    );
  }
}
