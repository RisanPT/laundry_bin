
import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloths_model.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';

class AddClothBottomSheetContentWidget extends HookConsumerWidget {
  final String? nameText;
  final bool isEdit;
  final ClothsModel cloth;

  const AddClothBottomSheetContentWidget({
    super.key,
    this.nameText,
    this.isEdit = false,
    required this.cloth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final clothNameController = useTextEditingController();
    final isLoading = useState(false);
    final imageController = useState<File?>(cloth.image.startsWith('http')
        ? null
        : File(cloth.image));

    useEffect(() {
      if (isEdit) {
        clothNameController.text = cloth.name;
      }
      return null;
    }, []);

    Future<void> handleSave() async {
      
      try{
        final selectedImage =
            ref.read(imagePickerProvider) ?? imageController.value;


        if (isEdit) {
          // Update existing cloth
          await ref.read(clothsControllerProvider.notifier).updateCloth(
                cloth.id,
                clothNameController.text,
                selectedImage,
              );
        } else {
          // Add new cloth
          await ref.read(clothsControllerProvider.notifier).addCloth(
                clothNameController.text,
                selectedImage!,
              );
        }
      }catch(e){
        
    // Get the image as File?
    final File? imageFile = ref.watch(imagePickerProvider);

    Future<void> addClothBtnCallback() async {
      if (clothNameController.text.trim().isNotEmpty && imageFile != null) {
        isLoading.value = true;
        await ref
            .read(clothsControllerProvider.notifier)
            .addCloth(clothNameController.text, imageFile);
        Future.sync(() {
          context.pop();
        });

      }
       isLoading.value = false;
       
        
      }
    

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: context.space.space_200,
          left: context.space.space_200,
          right: context.space.space_200,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isEdit ? "Edit Cloths": context.l10n.addCloths,
              style: context.typography.h3
                  .copyWith(color: context.colors.primaryTxt),
            ),
            Center(

              child: isEdit?ImagePickerForServices(
                initialImageUrl: imageController.value,
                urlImage: cloth.image.startsWith('http')
                    ? cloth.image
                    : null,
                onTap: () async {
                  ref
                      .read(imagePickerProvider.notifier)
                      .pickImage();
                  imageController.value = await ref.read(imagePickerProvider);

              child: ImagePickerForServices(
                urlImage: null,

                initialImage: imageFile, // Pass File? here
                onTap: () {
                  ref.read(imagePickerProvider.notifier).pickImage();

                },
              ):ImagePickerForServices(onTap: () async {
                ref
                    .read(imagePickerProvider.notifier)
                    .pickImage();
                imageController.value = await ref.read(imagePickerProvider);
              }),
            ),
            Text(
              context.l10n.instructionsTitle,
              style: context.typography.bodyLargeSemiBold
                  .copyWith(color: context.colors.primaryTxt),
            ),
            SizedBox(height: context.space.space_100),
            TextFieldWidget(
              controller: clothNameController,
              hintText: context.l10n.textfieldTitle,
             
            ),
            SizedBox(height: context.space.space_150),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                isLoading: isLoading.value,
                label: context.l10n.save,
                onTap: ()async{
                  handleSave();
                  context.pop();
                },
              ),
            ),
            SizedBox(height: context.space.space_100),
          ],
        ),
      ),
    );
  }
}