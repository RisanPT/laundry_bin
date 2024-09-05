import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/profile/user/view/widgets/changebutton.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.space.space_900 * 2.3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.space.space_150,
          vertical: context.space.space_250,
        ),
        child: Column(
          children: [
            ChangeButton(
              onTap: () {},
              name: context.l10n.deleteProfilePic,
              hintTextcolor: context.colors.primary,
              color: context.colors.white,
            ),
            SizedBox(height: context.space.space_200),
            ChangeButton(
              onTap: () {},
              name: context.l10n.changeProfilePic,
              hintTextcolor: context.colors.primary,
              color: context.colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
