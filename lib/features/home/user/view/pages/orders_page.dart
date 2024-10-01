import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/widgets/orders_page_widgets/drop_down_container.dart';
import 'package:laundry_bin/features/home/user/view/widgets/orders_page_widgets/laundry_box.dart';
import 'package:laundry_bin/features/home/user/view/widgets/orders_page_widgets/laundry_card.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.space.space_200),
          child: Column(
            children: [
              SizedBox(
                height: context.space.space_400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.orders,
                    style: context.typography.h2,
                  ),
                  OrderDropdown(),
                ],
              ),
              SizedBox(
                height: context.space.space_100,
              ),
              LaundryCard(
                statuscolor: Color(0xFFf3dd0f),
                name: 'Washing',
                img: Assets.images.imgWashingPage,
              ),
              LaundryCard(
                statuscolor: Color(0xFF30d472),
                name: 'Ironing',
                price: '499',
                img: Assets.images.imgOnboardWashingMechne,
              ),
              LaundryBox(
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
