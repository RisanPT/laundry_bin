import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/image_picker_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/offers/controllers/toggle_controller.dart';
import 'package:laundry_bin/features/offers/view/widgets/switchbutton_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/services_grid_view_container_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AddOfferPage extends HookConsumerWidget {
  const AddOfferPage({super.key});

  @override
/// Builds the UI for the AddOfferPage.
///
/// The function takes a [BuildContext] and a [WidgetRef] as parameters.
///
/// It returns a [Widget] that represents the UI of the AddOfferPage.
///
/// The function first retrieves the [offerModelsProvider] and [imagePickerProvider]
/// from the [WidgetRef]. It also checks if all the models in the [offerModelsProvider]
/// are selected.
///
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
    final image = ref.watch(imagePickerProvider);

    final ispercentage = useState<bool>(false);

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
            GestureDetector(
              onTap: () async {
                ref.watch(imagePickerProvider.notifier).pickImage();
              },
              child: DottedBorder(
                radius: Radius.circular(context.space.space_100),
                borderType: BorderType.RRect,
                color: context.colors.grey,
                child: Container(
                  height: context.space.space_500 * 6,
                  alignment: Alignment.center,
                  child: ClipRRect(
                    child: SizedBox(
                        width: double.infinity,
                        height: context.space.space_500 * 5.9,
                        child: image != null
                            ? Image.file(
                                image,
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.icAddImage,
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
                              )),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.space.space_200),
            SectionTitleWidget(title: context.l10n.instructionsTitle),
            SizedBox(height: context.space.space_200),
            TextFieldWidget(
              hintText: context.l10n.textfieldTitle,
            ),
            SizedBox(height: context.space.space_300),
            SectionTitleWidget(title: context.l10n.offerdescription),
            SizedBox(height: context.space.space_200),
            TextFieldWidget(
              hintText: context.l10n.textfieldDescription,
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
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
