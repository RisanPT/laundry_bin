import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';

import 'package:laundry_bin/features/serviceability/admin/view/widgets/bottom_sheet_image_add_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_cloth_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServicesPage extends HookWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    /// Handles the action when the add button is pressed.
    ///
    /// This function checks the current index of the [tabController] and performs
    /// different actions based on the index. If the index is 0, it calls the
    /// [showDialogueImageAdd] function with the provided [context]. If the index
    /// is 1, it navigates to the [AddServicePage] by pushing a new route onto the
    /// [Navigator] with the provided [context].
    ///
    /// This function does not return anything.
    void handleAddButtonPressed() {
      if (tabController.index == 0) {
        showDialogueImageAdd(context);
      } else if (tabController.index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddServicePage()),
        );
      }
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: handleAddButtonPressed,
              icon: const Icon(Icons.add_sharp),
            ),
          ],
          title: Text(
            context.l10n.services,
            style: TextStyle(color: context.colors.primaryTxt),
          ),
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: context.colors.primary,
            indicatorColor: context.colors.primary,
            labelStyle: context.typography.bodySemiBold,
            unselectedLabelStyle: context.typography.bodySmallSemiBold,
            tabs: [
              Tab(text: context.l10n.cloths),
              Tab(text: context.l10n.services),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFieldWidget(
                    hintText: context.l10n.textfieldsearch,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 140,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) =>
                        ServicesGridViewClothContainerWidget(
                      title: "Shirt",
                      icon: Assets.icons.icShirtWashingPage,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFieldWidget(
                    hintText: context.l10n.textfieldsearch,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 100,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 140,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) =>
                        ServicesGridViewContainerWidget(
                      title: "Washing",
                      onTap: () {},
                      icon: Assets.icons.iconWashingHomescreen,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
