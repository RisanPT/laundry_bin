import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';


class StatusContainer extends StatelessWidget {
  const StatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.space.space_700 * 2,
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(context.space.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: context.typography.h3
                  .copyWith(color: context.colors.primary),
            ),
            SizedBox(
              height: context.space.space_150,
            ),
            Container(
              width: double.infinity,
              height: context.space.space_400,
              decoration: BoxDecoration(
                  color: const Color(0xFFebfbfc),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    width: context.space.space_100,
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Color(0xFF34d5e5),
                  ),
                  SizedBox(
                    width: context.space.space_200,
                  ),
                  Text(
                    'Booking accepted',
                    style: context.typography.bodySemiBold
                        .copyWith(color: const Color(0xFF34d5e5)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
