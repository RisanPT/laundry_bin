import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/add_cloth_bottom_sheet_content_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/edit_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_cloth_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';

class ServicesPage extends HookConsumerWidget {
  ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final tabController = useTabController(initialLength: 2);
    final clothsScrollController = useScrollController();
    final isSearchVisible = ref.watch(isSearchVisibleProvider);

    Future<void> editService(ServicesModel service) async {
      try {
        await ref.read(servicesDBServicesProvider).updateService(
            service); // Use the provider to access the service DB
        // {{ edit_1 }}
        // state = [...state]; // Refresh the state if necessary
        ref.refresh(getAllServicesProvider); // Refresh the services provider
      } catch (e) {
        log('Error updating service: $e');
      }
    }

    Future<void> deleteImage(String imagePath) async {
      // Example logic for deleting an image
      try {
        // Your image deletion logic here, e.g., using a storage service
        // await storageService.deleteImage(imagePath);
        log('Image deleted: $imagePath'); // Placeholder for actual deletion logic
      } catch (e) {
        log('Error deleting image: $e');
      }
    }

    /// Handles the action when the add button is pressed.
    void handleAddButtonPressed() {
      if (tabController.index == 0) {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) =>   const AddClothBottomSheetContentWidget(
            isEdit: false,
           cloth: ClothsModel(
             name: "",
             image: "", 
             id: ''
           ),
          ),
        );
      } else if (tabController.index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const AddServicePage(
            isEdit: false,
            services: ServicesModel(
              name: "",
              image: "",
              id: '',
              cloths: [],
            )
          )),
        );
      }
    }

   

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                             
                              onTap: () {
                                showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) =>  AddClothBottomSheetContentWidget(
            nameText: cloth.name,
            isEdit: true,
            cloth: cloths[index],


          ));
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
                                          onPressed: () async {
                                            // Changed to editService
                                            Navigator.pop(context);
                                        
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                           ref.read(clothsDBServicesProvider).deleteCloth(cloth);
                                           ref.invalidate(clothsDBServicesProvider);
                                            Navigator.of(context).pop();
                                            // Navigator.of(context).pop();
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
                        ),
                      AsyncError() => const Center(
                          child: Text('ERROR'),
                        ),
                      _ => const LoadingIndicator()
                    },
                  ),
                ),
              ],
            ),

            /// Services tab view
            Column(
              children: [
                SizedBox(
                  height: context.space.space_400,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.space.space_200),
                    child: switch (ref.watch(getAllServicesProvider)) {
                      AsyncData(value: final services) => GridView.builder(
                          controller: clothsScrollController,
                          itemCount: services.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 10,
                            maxCrossAxisExtent: 300,
                            mainAxisExtent: 140,
                            crossAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            final service = services[index];

                            return GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Services'),
                                      content: const Text(
                                          'Are you sure you want to delete this item?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            // Changed to editService
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditServicePage(
                                                  service: service,
                                                ), // Replace with your destination page
                                              ),
                                            );
                                          },
                                          child: const Text('Update'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await ref
                                                .read(
                                                    servicesDBServicesProvider)
                                                .deleteService(service);
                                            Navigator.of(context).pop();
                                            // Navigator.of(context).pop();
                                          },
                                          child: const Text('Delete'),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddServicePage(
                                    isEdit: true,
                                    services: service.copyWith(
                                      cloths: service.cloths
                                    ),
                                    nameText: service.name,

                                  ),));
                                },
                              ),
                            );
                          },
                        ),
                      AsyncError() => const Center(
                          child: Text('ERROR'),
                        ),
                      _ => const LoadingIndicator()
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final isSearchVisibleProvider = StateProvider<bool>((ref) => false);
}
