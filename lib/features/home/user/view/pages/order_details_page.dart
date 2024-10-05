import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/pages/bottom_sheets/confirm_cancel.dart';
import 'package:laundry_bin/features/home/user/view/pages/bottom_sheets/feedback_bottomsheet.dart';
import 'package:laundry_bin/features/home/user/view/widgets/order_details_page/adress_container.dart';
import 'package:laundry_bin/features/home/user/view/widgets/order_details_page/status_card.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/Summary/reciept_card.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    super.key,
  });
  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Makes the bottom sheet full screen when necessary
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return const FeedbackBottomSheet();
      },
    );
  }

  void _showFeedbackBottomSheet2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return const ConfirmCancel();
      },
    );
  }

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
          padding: EdgeInsets.all(context.space.space_150),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    _showFeedbackBottomSheet(context);
                  },
                  child: const StatusContainer()),
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
              TextButton(
                  onPressed: () {
                    _showFeedbackBottomSheet2(context);
                  },
                  child: Text(
                    "Cancel Booking",
                    style: context.typography.bodySemiBold
                        .copyWith(color: const Color.fromARGB(255, 185, 23, 11)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
