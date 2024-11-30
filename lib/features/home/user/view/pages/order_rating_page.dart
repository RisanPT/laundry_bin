import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/widgets/order_details_page/adress_container.dart';
import 'package:laundry_bin/features/home/user/view/widgets/order_details_page/rating_container.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/Summary/reciept_card.dart';

class OrderRatingPage extends StatelessWidget {
  const OrderRatingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.colors.backgroundSubtle,
        title: const Text("Id:152589"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.space.space_100),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const RatingWidget(),
              SizedBox(
                height: context.space.space_150,
              ),
              const AdressContainer(
                txt1: "Pickup",
              ),
              SizedBox(
                height: context.space.space_150,
              ),
              const AdressContainer(txt1: "Delivery (Express)"),
              SizedBox(
                height: context.space.space_150,
              ),
              const ReceiptCard(),
              SizedBox(
                height: context.space.space_150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
