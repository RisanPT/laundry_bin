import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/offers/controllers/offer_controller.dart';
import 'package:laundry_bin/features/offers/controllers/pick_svg_controller.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:laundry_bin/features/offers/view/widgets/switchbutton_widget.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/DateandtimePicker/datepicker.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AddOfferPage extends HookConsumerWidget {
  const AddOfferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerImage = ref.watch(imagePickerProvider);
    final services = ref.watch(getAllServicesProvider);
    final selectedServices = useState<Set<String>>({});
    final ispercentage = useState<bool>(false);
    final isPressed = useState(false);
    final offerTypeController = useTextEditingController();
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final minOrderValueController = useTextEditingController();
    final maxApplyCountController = useTextEditingController();
    final startDateController = useTextEditingController();
    final endDateController = useTextEditingController();
    final selectedImagePath = useState<String?>(null);

    void saveoffer() {}

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.addoffersbtntxt),
      ),
      backgroundColor: context.colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.space.space_200),
              InkWell(
                onTapDown: (_) => isPressed.value = true,
                onTapUp: (_) => isPressed.value = false,
                onTapCancel: () => isPressed.value = false,
                onTap: () {
                  ref.read(imagePickerProvider.notifier).pickImage();
                },
                child: DottedBorder(
                  radius: Radius.circular(context.space.space_100),
                  borderType: BorderType.RRect,
                  color: context.colors.grey,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(context
                        .space.space_100), // Ensure image respects the curve
                    child: Container(
                      color: isPressed.value
                          ? context.colors.grey.withOpacity(0.2)
                          : context.colors.white,
                      height: context.space.space_500 * 6,
                      alignment: Alignment.center,
                      child: offerImage != null
                          ? Image.file(
                              File(offerImage.path),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.icAddImage, // Placeholder icon
                                  height: context.space.space_500,
                                  colorFilter: ColorFilter.mode(
                                      context.colors.grey, BlendMode.srcIn),
                                ),
                                SizedBox(height: context.space.space_100),
                                Text(
                                  context.l10n.addimage,
                                  style: context.typography.bodyMedium
                                      .copyWith(color: context.colors.grey),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.space.space_200),
              SectionTitleWidget(title: context.l10n.instructionsTitle),
              SizedBox(height: context.space.space_200),
              TextFieldWidget(
                controller: titleController,
                hintText: context.l10n.textfieldTitle,
              ),
              SizedBox(height: context.space.space_300),
              SectionTitleWidget(title: context.l10n.offerdescription),
              SizedBox(height: context.space.space_200),
              TextFieldWidget(
                hintText: context.l10n.textfieldDescription,
                controller: descriptionController,
              ),
              SizedBox(height: context.space.space_300),
              SectionTitleWidget(title: context.l10n.offerdetails),
              SizedBox(height: context.space.space_200),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchButton(
                      onPressed: () {
                        ispercentage.value = true;
                      },
                      isSelected: ispercentage.value,
                      text: context.l10n.percentage),
                  SizedBox(
                    width: context.space.space_200,
                  ),
                  SwitchButton(
                    onPressed: () {
                      ispercentage.value = false;
                    },
                    isSelected: !ispercentage.value,
                    text: context.l10n.amount,
                  ),
                ],
              ),
              SizedBox(height: context.space.space_300),
              SectionTitleWidget(
                  title: ispercentage.value
                      ? context.l10n.offerpercentage
                      : context.l10n.offeramount),
              SizedBox(height: context.space.space_200),
              TextFieldWidget(
                hintText: ispercentage.value
                    ? context.l10n.enterpercentage
                    : context.l10n.enteramount,
                keyboardType: TextInputType.number,
                controller: offerTypeController,
              ),
              SizedBox(height: context.space.space_300),
              const SectionTitleWidget(
                title: "Minimum Order value",
              ),
              SizedBox(height: context.space.space_200),
              TextFieldWidget(
                keyboardType: TextInputType.number,
                hintText: "Enter Minimum Order value",
                controller: minOrderValueController,
              ),
              SizedBox(height: context.space.space_200),
              const SectionTitleWidget(title: "Maximum Apply Count"),
              SizedBox(height: context.space.space_200),
              TextFieldWidget(
                keyboardType: TextInputType.number,
                controller: maxApplyCountController,
                hintText: "Enter Maximum Apply Count",
              ),
              SizedBox(height: context.space.space_200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: SectionTitleWidget(title: "Starting Date"),
                  ),
                  SizedBox(
                    width: context.space.space_700,
                  ),
                  const Expanded(child: SectionTitleWidget(title: "End Date")),
                ],
              ),
              SizedBox(height: context.space.space_200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DatePicker(
                    controller: startDateController,
                  ),
                  SizedBox(
                    width: context.space.space_200,
                  ),
                  DatePicker(
                    controller: endDateController,
                  )
                ],
              ),
              SizedBox(height: context.space.space_300),
              services.when(
                data: (services) {
                  return Column(
                    children: [
                      SectionTitleWidget(
                        title: context.l10n.services,
                        trailing: TextButton(
                            onPressed: () {
                              if (selectedServices.value.length ==
                                  services.length) {
                                selectedServices.value = {};
                              } else {
                                selectedServices.value = {
                                  for (var service in services) service.id
                                };
                              }
                            },
                            child: Text(
                                selectedServices.value.length == services.length
                                    ? "Deselect All"
                                    : "Select All")),
                      ),
                      SizedBox(height: context.space.space_200),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: services.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: 20,
                          maxCrossAxisExtent: 300,
                          mainAxisExtent: 160,
                          crossAxisSpacing: 0,
                        ),
                        itemBuilder: (context, index) {
                          final service = services[index];

                          void onTapCallBack() {
                            if (selectedServices.value.contains(service.id)) {
                              selectedServices.value = selectedServices.value
                                  .where((e) => e != service.id)
                                  .toSet();
                            } else {
                              selectedServices.value = {
                                ...selectedServices.value,
                                service.id
                              };
                            }
                          }

                          return ServicesGridViewContainerWidget(
                            checkbox: Checkbox(
                                value:
                                    selectedServices.value.contains(service.id),
                                onChanged: (value) {
                                  onTapCallBack();
                                }),
                            onTap: onTapCallBack,
                            title: service.name,
                            icon: service.image,
                          );
                        },
                      ),
                    ],
                  );
                },
                error: (error, stack) => Center(child: Text('Error: $error')),
                loading: () => SizedBox(
                  height: context.space.space_600 * 10,
                  child: GridView.builder(
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) =>
                        ServicesGridViewContainerWidget(
                      title: "",
                      icon: "",
                      onTap: () {},
                      isLoading: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.space.space_300),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.space.space_200,
            vertical: context.space.space_150),
        child: ButtonWidget(
          label: context.l10n.save,
          onTap: () {
            final image = offerImage;
            DateFormat dateFormat = DateFormat("dd-MM-yyyy");

            DateTime? startDate;
            if (startDateController.text.isNotEmpty) {
              startDate = dateFormat.parse(startDateController.text.trim());
            }

            DateTime? endDate;
            if (endDateController.text.isNotEmpty) {
              endDate = dateFormat.parse(endDateController.text.trim());
            }

            if (titleController.text.isEmpty) {
              SnackbarUtil.showsnackbar(message: "Please enter title");
              return;
            }
            if (startDate != null &&
                endDate != null &&
                startDate.isAtSameMomentAs(DateTime.now())) {
              SnackbarUtil.showsnackbar(
                  message: "Start date should be after today");
              return;
            }
            if (endDate != null &&
                startDate != null &&
                endDate.isBefore(startDate)) {
              SnackbarUtil.showsnackbar(
                  message: "End date should be after start date");
              return;
            }

            if (maxApplyCountController.text.isEmpty) {
              SnackbarUtil.showsnackbar(
                  message: "Please enter max apply count");
              return;
            }
            if (selectedServices.value.isEmpty) {
              SnackbarUtil.showsnackbar(message: "Please select services");
              return;
            }

            if (ispercentage.value) {
              // Validation for percentage (1-100)
              final percentage = int.tryParse(offerTypeController.text);
              if (percentage == null || percentage < 1 || percentage > 100) {
                SnackbarUtil.showsnackbar(
                    message: "Percentage should be between 1 and 100");
                return;
              }
            } else {
              if (!RegExp(r'^[1-9]\d*$').hasMatch(offerTypeController.text)) {
                SnackbarUtil.showsnackbar(
                    message: "Amount should be greater than 0");
                return;
              }
            }

            ref.read(offerControllerProvider.notifier).addOffer(
                  title: titleController.text.trim(),
                  offerTypeEnum: ispercentage.value
                      ? OfferType.percentage
                      : OfferType.amount,
                  offerTypeValue: double.parse(offerTypeController.text),
                  maxApplyCount: maxApplyCountController.text.isEmpty
                      ? 0
                      : int.parse(maxApplyCountController.text),
                  description: descriptionController.text.trim(),
                  image: image,
                  startDate:
                      startDateController.text.isEmpty ? null : startDate,
                  endDate: endDateController.text.isEmpty ? null : endDate,
                  minOrderValue: minOrderValueController.text.isEmpty
                      ? 0
                      : int.parse(minOrderValueController.text),
                  serviceIds: selectedServices.value.toList(),
                );

            context.pop();
          },
        ),
      ),
    );
  }
}
