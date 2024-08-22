import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AvailableClothsSectionWidget extends StatelessWidget {
  const AvailableClothsSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.space.space_100,
              horizontal: context.space.space_200),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.icons.icShirtWashingPage,
                width: context.space.space_300,
              ),
              SizedBox(width: context.space.space_200),
              Expanded(
                child: Text(
                  'Cloth $index',
                  style: context.typography.bodyMedium,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.space.space_900,
                ),
                child: const TextFieldWidget(
                  keyboardType: TextInputType.number,
                  hintText: '\$0.00',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
