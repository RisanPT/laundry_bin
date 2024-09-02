import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/service_cloth_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/available_cloths_section_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/instructions/controller/model/instruction_model.dart';

class EditServicePage extends HookConsumerWidget {
  final ServicesModel service;

  const EditServicePage({super.key, required this.service});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: service.name);
    final clothPrices = useState<Map<String, double>>({});
    final instructionControllersState =
        useState<List<InstructionTextEditingControllers>>([]);

    useEffect(() {
      clothPrices.value = {
        for (var cloth in service.cloths) cloth.clothId: cloth.price,
      };
      return null;
    }, []);

    File? imageFile;
    if (service.image.isNotEmpty && !service.image.startsWith('http')) {
      imageFile = File(service.image);
    }

    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        title: Text(context.l10n.editService),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
            child: Column(
              children: [
                /// Image picker
                SizedBox(height: context.space.space_200),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: context.space.space_100 * 40,
                    ),
                    child: ImagePickerForServices(
                      initialImage: imageFile,
                      urlImage: service.image.startsWith('http')
                          ? service.image
                          : null,
                      onTap: () async {
                        await ref
                            .read(imagePickerProvider.notifier)
                            .pickImage();
                        imageFile = ref.read(imagePickerProvider);
                      },
                    ),
                  ),
                ),
                SizedBox(height: context.space.space_400),

                /// Service title
                SectionTitleWidget(title: context.l10n.serviceTitle),
                SizedBox(height: context.space.space_200),
                TextFieldWidget(
                  controller: nameController,
                  hintText: context.l10n.hintTextforexample,
                ),
                SizedBox(height: context.space.space_400),

                /// Available cloths with price fields
                SectionTitleWidget(title: context.l10n.clothsAvailable),
                SizedBox(height: context.space.space_200),
                AvailableClothsSectionWidget(
                  initialPrices: clothPrices.value,
                  onPriceChanged: (clothId, newPrice) {
                    print('Price updated for $clothId: $newPrice');
                    clothPrices.value = {
                      ...clothPrices.value,
                      clothId: newPrice,
                    };
                  },
                ),
                SizedBox(height: context.space.space_400),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.space.space_200,
          vertical: context.space.space_200,
        ),
        child: ButtonWidget(
          label: context.l10n.save,
          onTap: () async {
            final name = nameController.text.trim();

            if (name.isEmpty) {
              SnackbarUtil.showsnackbar(
                  message: "Please provide a name for the service");
              return;
            }

            final clothPriceList = clothPrices.value.entries.map((entry) {
              return ServiceClothModel(
                clothId: entry.key,
                price: entry.value,
              );
            }).toList();

            final instructions =
                instructionControllersState.value.map((instructionController) {
              return InstructionModel(
                serviceId: '',
                title: instructionController.titleController.text,
                options: instructionController.optionsControllers
                    .map((optionController) {
                  return {
                    optionController.nameController.text: double.tryParse(
                            optionController.priceController.text) ??
                        0.0,
                  };
                }).toList(),
              );
            }).toList();
            final updatedService = service.copyWith(
              name: name,
              image: imageFile?.path ?? service.image,
              cloths: clothPriceList,
            );

            try {
              if (service.id.isEmpty) {
                // Add new service if id is empty
                await ref
                    .read(servicesControllerProvider.notifier)
                    .addService(name, imageFile!, instructions, clothPriceList);
              } else {
                // Update existing service
                await ref
                    .read(servicesDBServicesProvider)
                    .updateService(updatedService);
              }
              SnackbarUtil.showsnackbar(
                  message: "Service updated successfully");
              context.pop();
            } catch (e) {
              SnackbarUtil.showsnackbar(
                  message: "Failed to update service: $e");
            }
          },
        ),
      ),
    );
  }
}
