import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/widgets/order_details_page/date_picker.dart';

class AdressContainer extends StatelessWidget {
  final String txt1;
  const AdressContainer({super.key, required this.txt1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: context.space.space_25 * 101,
      decoration: BoxDecoration(
          color: context.colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(context.space.space_75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt1,
              style:
                  context.typography.h3.copyWith(color: context.colors.primary),
            ),
            SizedBox(
              height: context.space.space_150,
            ),
            Text(
              "19 Cross,between Hufuf and,Khobar",
              style: context.typography.bodySemiBold,
            ),
            Text('676552,India', style: context.typography.bodySemiBold),
            Text('+91 84156998625', style: context.typography.bodySemiBold),
            SizedBox(
              height: context.space.space_150,
            ),
            Row(
              children: [
                DatePickerOne(),
                SizedBox(
                  width: context.space.space_200,
                ),
                Column(
                  children: [
                    Container(
                      width: context.space.space_400 * 3,
                      height: context.space.space_500,
                      child: Center(
                          child: Text(
                        "Reshedule",
                        style: context.typography.bodySemiBold
                            .copyWith(color: context.colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: context.space.space_200,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
