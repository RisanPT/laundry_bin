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
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/available_cloths_section_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/instruction_item_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';

class EditServicePage extends HookConsumerWidget {
  final ServicesModel service; // Pass the service model

  const EditServicePage({super.key, required this.service}); // Constructor

  @override
  Widget build(BuildContext context, ref) {
    final instructionControllersState =
        useState<List<InstructionTextEditingControllers>>([]);

    final nameController = useTextEditingController(text: service.name);
    final services = ref.watch(servicesControllerProvider);

    // Initialize image controller with the existing image if it's a URL or a file path
    final imageController = useState<File?>(
        service.image != null && !service.image!.startsWith('http')
            ? File(service.image!)
            : null);

    final image =
        ref.watch(imagePickerProvider); // Watch the image picker state

    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        title: Text(context.l10n.editService),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
            child: services.isLoading
                ? const LoadingIndicator()
                : Column(
                    children: [
                      /// Image picker
                      SizedBox(height: context.space.space_200),
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: context.space.space_100 * 40,
                          ),
                          child: ImagePickerForServices(
                            initialImage: imageController.value ?? image,
                            urlImage: service.image.startsWith('http')
                                ? service.image
                                : null,
                            onTap: () async {
                              await ref
                                  .read(imagePickerProvider.notifier)
                                  .pickImage();
                              // Update the image controller with the selected image
                              imageController.value =
                                  ref.read(imagePickerProvider);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: context.space.space_400),

                      // Service title
                      SectionTitleWidget(title: context.l10n.serviceTitle),
                      SizedBox(height: context.space.space_200),
                      TextFieldWidget(
                        controller: nameController,
                        hintText: context.l10n.hintTextforexample,
                      ),
                      SizedBox(height: context.space.space_400),

                      // Available cloths
                      SectionTitleWidget(title: context.l10n.clothsAvailable),
                      SizedBox(height: context.space.space_200),
                      const AvailableClothsSectionWidget(),
                      SizedBox(height: context.space.space_200),

                      // Instructions
                      // SectionTitleWidget(title: context.l10n.instructions),

                      // InstrcutionItemWidget(
                      //   allInstructionsControllers: instructionControllersState,
                      // ),
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
          label: service == null ? context.l10n.addService : context.l10n.save,
          onTap: () {
            final image = ref.read(imagePickerProvider);
            final name = nameController.text.trim();
            final cloths = ref.read(
                clothsDBServicesProvider); // Assuming you have a provider for cloths

            if (name.isEmpty) {
              SnackbarUtil.showsnackbar(
                  message: "Please provide a name for the service");
              return;
            }

            if (service == null) {
              // Add new service
              if (image != null) {
                ref.read(servicesDBServicesProvider).updateService(
                      service.copyWith(
                        name: name,
                        image: image.path ?? service.image,
                        cloths: service
                            .cloths, // Include cloths when updating an existing service
                      ),
                      // Include cloths when adding a new service
                    );
                context.pop();
              } else {
                SnackbarUtil.showsnackbar(message: "Please pick an image");
              }
            } else {
              // Update existing service
              ref.read(servicesDBServicesProvider).updateService(
                    service.copyWith(
                      name: name,
                      image: image?.path ?? service.image,
                      cloths: service
                          .cloths, // Include cloths when updating an existing service
                    ),
                  );
              context.pop();
            }
          },
        ),
      ),
    );
  }
}
