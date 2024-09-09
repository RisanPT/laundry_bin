import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/offers/controllers/offer_controller.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:laundry_bin/features/offers/view/widgets/image_selection_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/switchbutton_widget.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/DateandtimePicker/datepicker.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';

class AddOfferPage extends HookConsumerWidget {
  static const String route = "/add-offer-page";
  final bool isEdit;
  final OfferModel? offer;
  const AddOfferPage({
    super.key,
    required this.isEdit,
    this.offer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerImage = ref.watch(imagePickerProvider);
    final services = ref.watch(getAllServicesProvider);
    final offerController = ref.watch(offerControllerProvider);
    final ispercentage = useState<bool>(
        isEdit ? offer!.offerTypeEnum == OfferType.percentage : false);
    final selectedServicesFromOffer =
        useState<Set<String>>(isEdit ? offer!.serviceIds!.toSet() : {});
    final offerTypeController = useTextEditingController(
        text: isEdit ? offer!.offerTypeValue.toString() : '');
    final titleController =
        useTextEditingController(text: isEdit ? offer!.title : '');
    final descriptionController =
        useTextEditingController(text: isEdit ? offer!.description : '');
    final minOrderValueController = useTextEditingController(
        text: isEdit ? offer!.minOrderValue.toString() : '');
    final maxApplyCountController = useTextEditingController(
        text: isEdit ? offer!.maxApplyCount.toString() : '');
    final startDateController = useTextEditingController();
    final endDateController = useTextEditingController();

    ///Set initial date in edit mode
    useEffect(() {
      if (isEdit) {
        if (offer!.startDate != null) {
          startDateController.text =
              DateFormat('dd-MM-yyyy').format(offer!.startDate!);
        }
        if (offer!.endDate != null) {
          endDateController.text =
              DateFormat('dd-MM-yyyy').format(offer!.endDate!);
        }
      }
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.addoffersbtntxt),
      ),
      backgroundColor: context.colors.white,
      body: offerController.isLoading
          ? const LoadingIndicator()
          : SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.space.space_200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.space.space_200),
                    OfferImagePickerWidget(
                        isEdit: isEdit, offer: offer, offerImage: offerImage),
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
                          text: context.l10n.percentage,
                        ),
                        SizedBox(width: context.space.space_200),
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
                          : context.l10n.offeramount,
                    ),
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
                    SizedBox(
                      child: SectionTitleWidget(
                          title: "Starting Date",
                          trailing: Padding(
                            padding: EdgeInsets.only(
                                right: context.space.space_400 * 3),
                            child: Text("End Date",
                                style: context.typography.bodySemiBold),
                          )),
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
                                    if (selectedServicesFromOffer
                                            .value.length ==
                                        services.length) {
                                      selectedServicesFromOffer.value = {};
                                    } else {
                                      selectedServicesFromOffer.value = {
                                        for (var service in services) service.id
                                      };
                                    }
                                  },
                                  child: Text(
                                      selectedServicesFromOffer.value.length ==
                                              services.length
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
                                  if (selectedServicesFromOffer.value
                                      .contains(service.id)) {
                                    selectedServicesFromOffer.value = {
                                      ...selectedServicesFromOffer.value
                                    }..remove(service.id);
                                  } else {
                                    selectedServicesFromOffer.value = {
                                      ...selectedServicesFromOffer.value
                                    }..add(service.id);
                                  }
                                }

                                return ServicesGridViewContainerWidget(
                                  checkbox: Checkbox(
                                      value: selectedServicesFromOffer.value
                                          .contains(service.id),
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
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                      loading: () => const LoadingIndicator(),
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
          label: isEdit ? "Update" : context.l10n.save,
          onTap: () async {
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
                startDate.isBefore(DateTime.now())) {
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
            if (selectedServicesFromOffer.value.isEmpty) {
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
            isEdit
                ? await ref.read(offerControllerProvider.notifier).updateOffer(
                      id: offer!.id,
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
                      serviceIds: selectedServicesFromOffer.value.toList(),
                    )
                : await ref.read(offerControllerProvider.notifier).addOffer(
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
                      serviceIds: selectedServicesFromOffer.value.toList(),
                    );
            context.pop();
          },
        ),
      ),
    );
  }
}
