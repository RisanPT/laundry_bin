import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloths_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/add_cloth_bottom_sheet_content_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_cloth_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';

class ServicesPage extends HookConsumerWidget {
  ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final clothsScrollController = useScrollController();
    final servicesScrollController = useScrollController();
    final isSearchVisible = ref.watch(isSearchVisibleProvider);
    final searchText = useState<String>("");
   
    List<ServicesModel> searchServices(
        String query, List<ServicesModel> allServices) {
      if (query.isEmpty) {
        return allServices;
      } else {
        return allServices
            .where((service) =>
                service.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    List<ClothsModel> searchCloth(String query, List<ClothsModel> allCloths) {
      if (query.isEmpty) {
        return allCloths;
      } else {
        return allCloths
            .where((cloths) =>
                cloths.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    void handleAddButtonPressed() {
      if (tabController.index == 0) {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) => const AddClothBottomSheetContentWidget(
            isEdit: false,
            cloth: ClothsModel(name: "", image: "", id: ''),
          ),
        );
      } else {
        context.push(AddServicePage.route,
            extra:
                const ServicesModel(id: "", name: "", image: "", cloths: []));
      }
    }

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: isSearchVisible
                ? TextFieldWidget(
                    onChanged: (value) => searchText.value = value,
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
                      child: ref.watch(allClothsProvider).when(
                            data: (cloths) {
                              final filteredCloths =
                                  searchCloth(searchText.value, cloths);

                              return GridView.builder(
                                controller: clothsScrollController,
                                itemCount: filteredCloths.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 10,
                                  maxCrossAxisExtent: 300,
                                  mainAxisExtent: 140,
                                  crossAxisSpacing: 0,
                                ),
                                itemBuilder: (context, index) {
                                  final cloth = filteredCloths[index];
                                  return ServicesGridViewClothContainerWidget(
                                    title: cloth.name,
                                    icon: cloth.image,
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20)),
                                        ),
                                        context: context,
                                        builder: (context) =>
                                            AddClothBottomSheetContentWidget(
                                          nameText: cloth.name,
                                          isEdit: true,
                                          cloth: cloths[index],
                                        ),
                                      );
                                    },
                                    onLongPress: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(context.l10n.cloths),
                                            content: const Text(
                                                'Are you sure you want to delete this item?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  ref
                                                      .read(
                                                          clothsDBServicesProvider)
                                                      .deleteCloth(cloth);
                                                  ref.invalidate(
                                                      clothsDBServicesProvider);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            loading: () => const LoadingIndicator(),
                            error: (error, stackTrace) => const Center(
                              child: Text('ERROR'),
                            ),
                          ),
                    ),
                  ),
                ],
              ),

              /// Services tab view
              Column(
                children: [
                  SizedBox(
                    height: context.space.space_600,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.space.space_200),
                      child: ref.watch(getAllServicesProvider).when(
                            data: (services) {
                              final filteredServices =
                                  searchServices(searchText.value, services);

                              return GridView.builder(
                                controller: servicesScrollController,
                                itemCount: filteredServices.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 10,
                                  maxCrossAxisExtent: 300,
                                  mainAxisExtent: 140,
                                  crossAxisSpacing: 0,
                                ),
                                itemBuilder: (context, index) {
                                  final service = filteredServices[index];
                                  return GestureDetector(
                                    onLongPress: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                context.l10n.deleteService),
                                            content: const Text(
                                                'Are you sure you want to delete this item?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  context.pop();
                                                },
                                                child: Text(context.l10n.no),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await ref
                                                      .read(
                                                          servicesControllerProvider
                                                              .notifier)
                                                      .deleteService(
                                                          service.id);
                                                  Future.sync(() {
                                                    context.pop();
                                                  });
                                                },
                                                child: Text(context.l10n.yes),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: ServicesGridViewContainerWidget(
                                      title: service.name,
                                      icon: service.image,
                                      onTap: () {
                                        context.push(AddServicePage.route,
                                            extra: service);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            loading: () => const LoadingIndicator(),
                            error: (error, stackTrace) => const Center(
                              child: Text('ERROR'),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final isSearchVisibleProvider = StateProvider<bool>((ref) => false);
}
