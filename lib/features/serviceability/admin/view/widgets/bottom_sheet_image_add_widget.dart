import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/features/offers/services/pickfile.dart';
import 'package:laundry_bin/features/serviceability/admin/domain/model/cloths_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';

// Define the provider outside of the function
final selectedImagePathProvider = StateProvider<String?>((ref) => null);

Future<dynamic> showDialogueImageAdd(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    builder: (context) {
      return Consumer(builder: (context, ref, child) {
        final TextEditingController clothNameController =
            TextEditingController();

        final provider = ref.watch(clothsFirestoreServicesProvider);
        final selectedImagePath = ref.watch(selectedImagePathProvider);
        
        //  Future<void> saveCloth() async {
        //   if (selectedImagePath != null && clothNameController.text.isNotEmpty) {
        //     final cloth = ClothsModel(
        //       clothname: clothNameController.text,
        //       clothimage: selectedImagePath,
             
        //     );

        //     // Save to Firestore using the provider
        //     provider.addCloths(cloth);

        //     // Show a confirmation message (optional)
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Cloth added successfully!')),
        //     );
        //   } else {
        //     // Show an error message if the form is incomplete
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Please fill in all fields')),
        //     );
        //   }
        // }

        return SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    context.l10n.addCloths,
                    style: context.typography.h3
                        .copyWith(color: context.colors.primaryTxt),
                  ),
                ),
                Center(
                  child: ImagePickerForServices(
                    onTap: () {
                      ref.read(imagePickerProvider.notifier).pickImage();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: context.space.space_200),
                  child: Text(
                    context.l10n.instructionsTitle,
                    style: context.typography.bodyLargeSemiBold
                        .copyWith(color: context.colors.primaryTxt),
                  ),
                ),
                SizedBox(
                  height: context.space.space_100,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_200),
                  child: TextField(
                    controller: clothNameController,
                    decoration: InputDecoration(
                        hintText: context.l10n.textfieldTitle,
                        hintStyle: context.typography.bodyMedium
                            .copyWith(color: context.colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: context.colors.primary,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: context.colors.primary,
                        ))),
                  ),
                ),
                SizedBox(
                  height: context.space.space_150,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_100),
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonWidget(
                      label: context.l10n.save,
                      onTap: () async {
                        // Add cloth to Firestore
                        // await saveCloth();
                        context.pop(); // Close the modal
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: context.space.space_100,
                )
              ],
            ),
          ),
        );
      });
    },
  );
}
