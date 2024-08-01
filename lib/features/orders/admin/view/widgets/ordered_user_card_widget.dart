import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OrderedUserCardWidget extends StatelessWidget {
  const OrderedUserCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.space.space_200),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: context.colors.grey, width: context.space.space_25),
            borderRadius: BorderRadius.circular(context.space.space_200)),
        child: Padding(
          padding: EdgeInsets.all(context.space.space_200),
          child: Row(
            children: [
              CircleAvatar(
                minRadius: context.space.space_300,
              ),
              SizedBox(
                width: context.space.space_200,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "userName",
                    style: context.typography.bodyLargeSemiBold,
                  ),
                  Text("#F256GDH54"),
                ],
              ),
              Expanded(child: SizedBox()),
              ElevatedButton(onPressed: () {}, child: Icon(Icons.message)),
            ],
          ),
        ),
      ),
    );
  }
}
