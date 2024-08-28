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
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';

class EditServicePage extends HookConsumerWidget {
  final ServicesModel service; // Pass the service model

  const EditServicePage({super.key, required this.service}); // Constructor

  @override
  Widget build(BuildContext context, ref) {
    final nameController = useTextEditingController(
        text: service.name); // Pre-fill with service name
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
            child: Column(
              children: [
                /// Image picker
                SizedBox(height: context.space.space_200),
                // Center(
                //   child: ConstrainedBox(
                //     constraints: BoxConstraints(
                //       maxWidth: context.space.space_100 * 40,
                //     ),
                //     child: ImagePickerForServices(
                //       onTap: () {
                //         ref.read(imagePickerProvider.notifier).pickImage();
                //       },
                //       initialImage: File(service.image),
                //       // Use the correct property name
                //     ),
                //   ),
                // ),
                // SizedBox(height: context.space.space_400),

                /// Service title
                SectionTitleWidget(title: context.l10n.serviceTitle),
                SizedBox(height: context.space.space_200),
                TextFieldWidget(
                  controller: nameController,
                  hintText: context.l10n.hintTextforexample,
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
            vertical: context.space.space_200),
        child: ButtonWidget(
          label: context.l10n.save,
          onTap: () {
            final selectedImage = ref.read(imagePickerProvider);
            final name = nameController.text;

            if (name.isNotEmpty) {
              ref.read(servicesDBServicesProvider).updateService(
                    service.copyWith(
                      name: name,
                    ), // Ensure image is a String
                  );
              context.pop();
            }
          },
        ),
      ),
    );
  }
}
