import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

import 'package:laundry_bin/features/serviceability/admin/view/widgets/bottom_sheet_image_add_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_cloth_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/text_field_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.colors.white,
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showDialogueImageAdd(context);
                  },
                  icon: const Icon(Icons.add_sharp))
            ],
            title: Text(
              "Services",
              style: TextStyle(color: context.colors.primaryTxt),
            ),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: context.colors.primary,
                indicatorColor: context.colors.primary,
                labelStyle: context.typography.bodySemiBold,
                unselectedLabelStyle: context.typography.bodySmallSemiBold,
                tabs: const [
                  Tab(
                    text: "Cloths",
                  ),
                  Tab(
                    text: "Services",
                  )
                ])),
        body: TabBarView(children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextfieldServicesWidget(),
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
                            icon: Assets.icons.icShirtWashingPage)),
              ),
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextfieldServicesWidget(),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 100,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 140,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) =>
                      ServicesGridViewContainerWidget(
                    title: "Washing",
                    icon: Assets.icons.iconWashingHomescreen,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
