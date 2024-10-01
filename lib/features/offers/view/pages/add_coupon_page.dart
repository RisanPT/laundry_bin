import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
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
        title: Text(context.l10n.couponHeading),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
        child: Column(children: [
          SizedBox(height: context.space.space_300),
          SectionTitleWidget(title: context.l10n.couponTitle),
          SizedBox(height: context.space.space_200),
          TextFieldWidget(
            hintText: context.l10n.couponHintTitle,
          ),
          SizedBox(height: context.space.space_300),
          SectionTitleWidget(title: context.l10n.couponCode),
          SizedBox(height: context.space.space_200),
          TextFieldWidget(
            hintText: context.l10n.couponSubTitle,
          ),
          SizedBox(height: context.space.space_300),
          SectionTitleWidget(title: context.l10n.couponHintType),
          SizedBox(height: context.space.space_200),
          Row(
            children: [
              SwitchButton(
                onPressed: () {
                  selectedButton.value = 0;
                },
                isSelected: selectedButton.value == 0,
                text: context.l10n.percentage,
              ),
              SizedBox(
                width: context.space.space_200,
              ),
              SwitchButton(
                onPressed: () {
                  selectedButton.value = 1;
                },
                isSelected: selectedButton.value == 1,
                text: context.l10n.amount,
              ),
              SizedBox(
                width: context.space.space_200,
              ),
              SwitchButton(
                onPressed: () {
                  selectedButton.value = 2;
                },
                isSelected: selectedButton.value == 2,
                text: context.l10n.freeDelivery,
              ),
            ],
          ),
          SizedBox(height: context.space.space_300),
          if (selectedButton.value == 0 || selectedButton.value == 1) ...[
            SectionTitleWidget(
                title: selectedButton.value == 0
                    ? context.l10n.couponPercentage
                    : context.l10n.couponAmount),
            SizedBox(height: context.space.space_200),
            if (selectedButton.value == 0 || selectedButton.value == 1)
              TextFieldWidget(
                keyboardType: TextInputType.number,
                hintText: selectedButton.value == 0
                    ? context.l10n.couponHintPercentage
                    : context.l10n.couponHintAmount,
              ),
          ] else ...[
            SectionTitleWidget(title: context.l10n.freeDelivery),
          ],
          SizedBox(
            height: context.space.space_150,
          ),
          SectionTitleWidget(title: context.l10n.conditions),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: context.space.space_200),
              DropDownButtonWidget(
                item1: context.l10n.couponCount,
                item2: context.l10n.amount,
              ),
              SizedBox(height: context.space.space_200),
              DropDownButtonWidget(
                item1: context.l10n.equal,
                item2: context.l10n.greater,
                item3: context.l10n.less,
              ),
              SizedBox(height: context.space.space_200),
              TextFieldWidget(
                hintText: context.l10n.hintValue,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: context.space.space_200),
              DropDownButtonWidget(
                item1: context.l10n.and,
                item2: context.l10n.or,
              ),
            ]),
          ),
          SizedBox(height: context.space.space_250),
        ]),
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.space.space_200,
            vertical: context.space.space_150),
        child: ButtonWidget(
          label: context.l10n.save,
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
