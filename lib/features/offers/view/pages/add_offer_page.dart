import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleProvider = ref.watch(offerModelsProvider);
    final allSelected =
        ref.watch(offerModelsProvider.notifier).areAllSelected();
    final ispercentage = useState<bool>(false);
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        title: const Text("Add Offer"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: context.space.space_200),
            GestureDetector(
              onTap: () async {},
              child: DottedBorder(
                radius: Radius.circular(context.space.space_100),
                borderType: BorderType.RRect,
                color: context.colors.grey,
                child: Container(
                  height: context.space.space_500 * 6,
                  // width: context.space.space_500 * 10,
                  alignment: Alignment.center,
                  child: Column(
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
                        "Add Image",
                        style: context.typography.bodyMedium
                            .copyWith(color: context.colors.grey),
                      )
                    ],
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
            const SectionTitleWidget(title: "Offer Description"),
            SizedBox(height: context.space.space_200),
            const TextFieldWidget(
              hintText: "Offer Description",
            ),
            SizedBox(height: context.space.space_300),
            const SectionTitleWidget(title: "Offer Details"),
            SizedBox(height: context.space.space_200),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchButton(
                    onPressed: () {
                      ispercentage.value = true;
                    },
                    isSelected: ispercentage.value,
                    text: "Percentage"),
                SizedBox(
                  width: context.space.space_200,
                ),
                SwitchButton(
                  onPressed: () {
                    ispercentage.value = false;
                  },
                  isSelected: !ispercentage.value,
                  text: "amount",
                ),
              ],
            ),
            SizedBox(height: context.space.space_300),
            SectionTitleWidget(
                title:
                    ispercentage.value ? "Offer Percentage" : "Offer Amount"),
            SizedBox(height: context.space.space_200),
            TextFieldWidget(
              hintText:
                  ispercentage.value ? "Enter Percentage" : "Enter Amount",
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
                    allSelected ? "Deselect All" : "Select All",
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
          label: "Save",
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
