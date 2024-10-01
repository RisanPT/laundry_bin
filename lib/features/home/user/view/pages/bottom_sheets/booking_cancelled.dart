import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/pages/bottom_sheets/feedback_bottomsheet.dart';
import 'package:laundry_bin/features/home/user/view/pages/orders_page.dart';

class BookingCancelled extends StatelessWidget {
  const BookingCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.space.space_400 * 9,
      decoration: BoxDecoration(
          color: context.colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(context.space.space_200),
        child: Column(
          children: [
            Text(
              "Booking",
              style: context.typography.h1.copyWith(color: Colors.red),
            ),
            Text(
              "Cancelled",
              style: context.typography.h1.copyWith(color: Colors.red),
            ),
            SizedBox(
              height: context.space.space_100,
            ),
            Text(
              "Your booking succesfully cancelled",
              style: context.typography.bodySemiBold,
            ),
            Text(
              "see you next time",
              style: context.typography.bodySemiBold,
            ),
            SizedBox(
              height: context.space.space_300,
            ),
            ButtonContainer(
                txt: "Back TO Home",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersPage()));
                })
          ],
        ),
      ),
    );
  }
}
