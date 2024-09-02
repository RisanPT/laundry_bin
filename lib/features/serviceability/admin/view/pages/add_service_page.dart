import 'dart:developer';

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
// import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/available_cloths_section_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/instruction_item_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/instructions/controller/model/instruction_model.dart';

class OptionTextEditingControllers {
  final TextEditingController nameController;
  final TextEditingController priceController;

  OptionTextEditingControllers({
    required this.nameController,
    required this.priceController,
  });
}

class InstructionTextEditingControllers {
  final TextEditingController titleController;
  List<OptionTextEditingControllers> optionsControllers;

  InstructionTextEditingControllers({
    required this.optionsControllers,
    required this.titleController,
  });
}

class AddServicePage extends HookConsumerWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final clothPrices = useState<Map<String, double>>({});
    final instructionControllersState =
        useState<List<InstructionTextEditingControllers>>([]);
    final nameController = useTextEditingController();
    final imagePickerController = ref.watch(imagePickerProvider);
    final service = ref.watch(servicesControllerProvider);

    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        title: Text(context.l10n.addService),
      ),
      body: service.isLoading
          ? const LoadingIndicator()
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_200),
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
                            urlImage: null,
                            initialImage: imagePickerController,
                            onTap: () async {
                              await ref
                                  .read(imagePickerProvider.notifier)
                                  .pickImage();
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
                        hintText: "e.g.Washing",
                      ),
                      SizedBox(height: context.space.space_400),

                      /// Available cloths
                      SectionTitleWidget(title: context.l10n.clothsAvailable),
                      SizedBox(height: context.space.space_200),
                      AvailableClothsSectionWidget(
                        initialPrices: clothPrices.value,
                        onPriceChanged: (clothId, newPrice) {
                          clothPrices.value = {
                            ...clothPrices.value,
                            clothId: newPrice,
                          };
                        },
                      ),
                      SizedBox(height: context.space.space_200),

                      ///Instructions
                      SectionTitleWidget(title: context.l10n.instructions),
                      SizedBox(height: context.space.space_200),
                      Text(
                        context.l10n.instructionsDetails,
                        style: context.typography.bodySmall
                            .copyWith(color: context.colors.hintTxt),
                      ),
                      SizedBox(height: context.space.space_400),
                      InstrcutionItemWidget(
                        allInstructionsControllers: instructionControllersState,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.space.space_200,
            vertical: context.space.space_200),
        child: ButtonWidget(
          label: context.l10n.addService,
          onTap: () {
            if (nameController.text.isEmpty) {
              SnackbarUtil.showsnackbar(message: "Please enter service name");
              return;
            }
            final image = ref.read(imagePickerProvider);
            final name = nameController.text;

            if (image != null) {
              final instructions = instructionControllersState.value
                  .map((instructionController) {
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
              ref
                  .read(servicesControllerProvider.notifier)
                  .addService(name, image, instructions);
              log('instructions: $instructions');
              log("name: $name");
              log("image: $image");
              Future.sync(() => context.pop());
            } else {
              SnackbarUtil.showsnackbar(message: "Please pick an image");
            }
          },
        ),
      ),
    );
  }
}
