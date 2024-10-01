import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/pages/bottom_sheets/cancel_reaosn.dart';

class ConfirmCancel extends StatelessWidget {
  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Makes the bottom sheet full screen when necessary
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return CancelReaosn();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.space.space_200),
              topRight: Radius.circular(context.space.space_200))),
      padding: EdgeInsets.all(context.space.space_250),
      height: context.space.space_400 * 8,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: context.space.space_100 * 40,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ],
          ),
          Text(
            "Are you Sure",
            style: context.typography.h1,
          ),
          SizedBox(
            height: context.space.space_50,
          ),
          Text(
            "Do you want to cancel",
            style: context.typography.subtitle,
          ),
          Text(
            "This Booking",
            style: context.typography.subtitle,
          ),
          SizedBox(
            height: context.space.space_200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                      child: Text(
                    "No",
                    style: context.typography.bodySemiBold
                        .copyWith(color: context.colors.white),
                  )),
                  width: context.space.space_500 * 3,
                  height: context.space.space_600,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius:
                        BorderRadius.circular(context.space.space_800),
                  ),
                ),
              ),
              SizedBox(
                width: context.space.space_100,
              ),
              GestureDetector(
                onTap: () {
                  _showFeedbackBottomSheet(context);
                },
                child: Container(
                  child: Center(
                      child: Text(
                    "Yes,Cancel",
                    style: context.typography.bodySemiBold
                        .copyWith(color: context.colors.white),
                  )),
                  width: context.space.space_500 * 3,
                  height: context.space.space_600,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 202, 27, 15),
                    borderRadius:
                        BorderRadius.circular(context.space.space_800),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
