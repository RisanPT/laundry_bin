import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/authentication/view/widgets/button_with_dropdown.dart';

class UserOrdersPage extends StatelessWidget {
  static const route = '/user_orders_page';
  const UserOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.backgroundSubtle,
        appBar: AppBar(
          toolbarHeight: context.space.space_500 * 2,
          automaticallyImplyLeading: false,
          title: Text(context.l10n.orders),
          backgroundColor: context.colors.backgroundSubtle,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: context.space.space_100),
              child: ElevatedDropdownButton(
                items: const ['All Orders', 'Pending', 'Completed'],
                initialValue: 'All Orders',
                onChanged: (String? newValue) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
