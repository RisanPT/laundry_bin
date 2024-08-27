import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/check_box_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/add_cloth_bottom_sheet_content_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_cloth_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServicesPage extends HookConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkBox = ref.watch(checkBoxControllerProvider(90));
    final tabController = useTabController(initialLength: 2);
    final clothsScrollController = useScrollController();
    final servicesScrollController = useScrollController();
    final isTextFieldVisible = useState(true);
    final isSearchVisible = ref.watch(isSearchVisibleProvider);

    /// Handles the action when the add button is pressed.
    void handleAddButtonPressed() {
      if (tabController.index == 0) {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) => const AddClothBottomSheetContentWidget(),
        );
      } else if (tabController.index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddServicePage()),
        );
      }
    }

    /// Listens to scroll events and toggles the visibility of the TextField.
    void handleScroll(ScrollController controller) {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (isTextFieldVisible.value) {
          isTextFieldVisible.value = false;
        }
      } else if (controller.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isTextFieldVisible.value) {
          isTextFieldVisible.value = true;
        }
      }
    }

    useEffect(() {
      clothsScrollController
          .addListener(() => handleScroll(clothsScrollController));
      servicesScrollController
          .addListener(() => handleScroll(servicesScrollController));

      return () {
        clothsScrollController
            .removeListener(() => handleScroll(clothsScrollController));
        servicesScrollController
            .removeListener(() => handleScroll(servicesScrollController));
      };
    }, []);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: isSearchVisible
              ? TextFieldWidget(
                  hintText: context.l10n.textfieldsearch,
                  keyboardType: TextInputType.text,
                )
              : Text(
                  context.l10n.services,
                  style: TextStyle(color: context.colors.primaryTxt),
                ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(isSearchVisibleProvider.notifier).state =
                    !isSearchVisible;
              },
              icon: Icon(
                isSearchVisible ? Icons.close : Icons.search,
              ),
            ),
            IconButton(
              onPressed: handleAddButtonPressed,
              icon: const Icon(Icons.add_sharp),
            ),
          ],
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
            /// Cloths tab view
            Column(
              children: [
                SizedBox(
                  height: context.space.space_600,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.space.space_200),
                    child: switch (ref.watch(allClothsProvider)) {
                      AsyncData(value: final cloths) => GridView.builder(
                          controller: clothsScrollController,
                          itemCount: cloths.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 10,
                            maxCrossAxisExtent: 300,
                            mainAxisExtent: 140,
                            crossAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            final cloth = cloths[index];

                            return ServicesGridViewClothContainerWidget(
                              title: cloth.name,
                              icon: cloth.image,
                              checkbox: Checkbox(
                                value: checkBox[index],
                                onChanged: (value) {},
                              ),
                              onTap: () {},
                              onLongPress: () {},
                            );
                          },
                        ),
                      AsyncError() => const Center(
                          child: Text('ERROR'),
                        ),
                      _ => const Center(
                          child: CircularProgressIndicator(),
                        )
                    },
                  ),
                ),
              ],
            ),

            /// Services tab view
            Column(
              children: [
                if (isTextFieldVisible.value && !isSearchVisible)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.space.space_200,
                        vertical: context.space.space_200),
                    child: TextFieldWidget(
                      keyboardType: TextInputType.none,
                      hintText: context.l10n.textfieldsearch,
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.space.space_200),
                    child: GridView.builder(
                      controller: servicesScrollController,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final isSearchVisibleProvider = StateProvider<bool>((ref) => false);
