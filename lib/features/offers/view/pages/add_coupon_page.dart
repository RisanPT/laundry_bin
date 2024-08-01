import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/drop_down_button_widget.dart';
import 'package:laundry_bin/features/offers/view/widgets/switchbutton_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';

class AddCouponPage extends HookConsumerWidget {
  const AddCouponPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedButton = useState<int>(0);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Coupon"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
          child: Column(children: [
            SizedBox(height: context.space.space_300),
            SectionTitleWidget(title: context.l10n.instructionsTitle),
            SizedBox(height: context.space.space_200),
            TextFieldWidget(
              hintText: context.l10n.textfieldTitle,
            ),
            SizedBox(height: context.space.space_300),
            const SectionTitleWidget(title: "Coupon Code"),
            SizedBox(height: context.space.space_200),
            const TextFieldWidget(
              hintText: "Enter Coupon Code",
            ),
            SizedBox(height: context.space.space_300),
            const SectionTitleWidget(title: "Coupon Type"),
            SizedBox(height: context.space.space_200),
            Row(
              children: [
                SwitchButton(
                  onPressed: () {
                    selectedButton.value = 0;
                  },
                  isSelected: selectedButton.value == 0,
                  text: "Percentage",
                ),
                SizedBox(
                  width: context.space.space_200,
                ),
                SwitchButton(
                  onPressed: () {
                    selectedButton.value = 1;
                  },
                  isSelected: selectedButton.value == 1,
                  text: "Amount",
                ),
                SizedBox(
                  width: context.space.space_200,
                ),
                SwitchButton(
                  onPressed: () {
                    selectedButton.value = 2;
                  },
                  isSelected: selectedButton.value == 2,
                  text: "Free Delivery",
                ),
              ],
            ),
            SizedBox(height: context.space.space_300),
            if (selectedButton.value == 0 || selectedButton.value == 1) ...[
              SectionTitleWidget(
                  title: selectedButton.value == 0
                      ? "Coupon Percentage"
                      : "Coupon Amount"),
              SizedBox(height: context.space.space_200),
              if (selectedButton.value == 0 || selectedButton.value == 1)
                TextFieldWidget(
                  hintText: selectedButton.value == 0
                      ? "Enter Percentage"
                      : "Enter Amount",
                ),
            ] else ...[
              const SectionTitleWidget(title: "Free Delivery"),
            ],
            SizedBox(
              height: context.space.space_150,
            ),
            const SectionTitleWidget(title: "Conditions"),
            SizedBox(
              height: context.space.space_150,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.space.space_200),
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(context.space.space_100),
                boxShadow: [context.shadow.offerContainerShadow],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.space.space_200),
                    const DropDownButtonWidget(
                      item1: "count",
                      item2: "amount",
                    ),
                    SizedBox(height: context.space.space_200),
                    const DropDownButtonWidget(
                      item1: "equalTo",
                      item2: "GreaterThan",
                      item3: "LessThan",
                    ),
                    SizedBox(height: context.space.space_200),
                    const TextFieldWidget(
                      hintText: 'enter value here',
                    ),
                    SizedBox(height: context.space.space_200),
                    const DropDownButtonWidget(
                      item1: "and",
                      item2: "or",
                    ),
                  ]),
            ),
          ]),
        )));
  }
}
