import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/offers/controllers/offer_filepicker_controller.dart';
import 'package:laundry_bin/features/offers/controllers/toggle_controller.dart';
import 'package:laundry_bin/features/offers/domain/offer_model_2.dart';
import 'package:laundry_bin/features/offers/services/pickfile.dart';
import 'package:laundry_bin/features/offers/view/widgets/switchbutton_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AddOfferPage extends HookConsumerWidget {
  const AddOfferPage({super.key});

  @override

  /// Next, it initializes a [useState] variable called [ispercentage] with a default
  /// value of false.
  ///
  /// The function then returns a [Scaffold] widget as the main container for the UI.
  /// The [AppBar] of the [Scaffold] has a title that is retrieved from the [context]
  /// using the [l10n.addoffersbtntxt] key.
  ///
  /// The body of the [Scaffold] contains a [SingleChildScrollView] with a [Padding]
  /// widget. The [Padding] has a horizontal padding of [space_200] and contains
  /// a [Column] widget.
  ///
  /// The [Column] contains various UI elements such as an image picker, text fields,
  /// switch buttons, and a grid view.
  ///
  /// The UI elements are built using various widgets such as [GestureDetector],
  /// [DottedBorder], [Container], [SvgPicture], [TextFieldWidget], [SectionTitleWidget],
  /// [SwitchButton], [Row], and [GridView.builder].
  ///
  /// The UI elements are styled using the [context]'s colors and typography.
  ///
  /// The function also includes a [bottomNavigationBar] that contains a [Padding]
  /// widget with a [ButtonWidget] that represents the save button.
  ///
  /// The function is annotated with the `@override` keyword to indicate that it
  /// overrides a method from a superclass.
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleProvider = ref.watch(offerModelsProvider);
    final allSelected =
        ref.watch(offerModelsProvider.notifier).areAllSelected();
    final ispercentage = useState<bool>(false);
    final isPressed = useState(false);
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final selectedImagePath = useState<String?>(null);

    void selectimage() async {
      String? filePath = await Pickfile.pickSVGFile();
      if (filePath != null) {
        selectedImagePath.value = filePath;
      } else {
        print('No file selected');
      }
    }

    void saveoffer() async {
      final title = titleController.text.trim();
      final image = selectedImagePath.value;

      if (title.isNotEmpty && image != null) {
        ref.read(pickedFilePathProvider.notifier).addFilePath(
              OfferModel2(title: title, image: image),
            );

        context.pop();
      } else {
        SnackbarUtil.showsnackbar(message: "Please add title and image");
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.addoffersbtntxt),
      ),
      backgroundColor: context.colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: context.space.space_200),
            InkWell(
              onTapDown: (_) => isPressed.value = true,
              onTapUp: (_) => isPressed.value = false,
              onTapCancel: () => isPressed.value = false,
              onTap: () {
                isPressed.value = true;
                selectimage();
                isPressed.value = false;
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
                    child: selectedImagePath.value != null &&
                            selectedImagePath.value!.isNotEmpty
                        ? SvgPicture.file(
                            File(selectedImagePath.value!),
                            height: context.space.space_500 * 6,
                            fit: BoxFit
                                .cover, // Ensure the image covers the area
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
            ),
            SizedBox(height: context.space.space_300),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: SectionTitleWidget(title: context.l10n.services)),
                TextButton(
                  onPressed: () {
                    ref.read(offerModelsProvider.notifier).allSelection();
                  },
                  child: Text(
                    allSelected
                        ? context.l10n.deselectall
                        : context.l10n.selectall,
                    style: context.typography.bodySemiBold
                        .copyWith(color: context.colors.primary),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.space.space_200),
            GridView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: toggleProvider.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 300,
                mainAxisExtent: 160,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                final items = toggleProvider[index];

                return ServicesGridViewContainerWidget(
                  onTap: () {},
                  title: "Washing",
                  icon: Assets.icons.iconWashingHomescreen,
                  checkbox: Checkbox(
                      value: items.isSelected,
                      onChanged: (value) {
                        ref
                            .read(offerModelsProvider.notifier)
                            .toggleSelection(index);
                      }),
                );
              },
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
        child: ButtonWidget(
          label: context.l10n.save,
          onTap: () => saveoffer(),
        ),
      ),
    );
  }
}
