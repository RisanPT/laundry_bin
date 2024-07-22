import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/apptextfield.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSubtle,
      appBar: AppBar(
        backgroundColor: context.colors.backgroundSubtle,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(Assets.icons.icArrowLeft),
        ),
        title: Text(context.l10n.profileDetails,
            textAlign: TextAlign.center, style: context.typography.h2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: context.space.space_400,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colors.white,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                    radius: context.space.space_600,
                    backgroundColor: context.colors.background,
                    child: SvgPicture.asset(Assets.icons.icCamera)),
              ),
            ),
            SizedBox(
              height: context.space.space_300,
            ),
            Padding(
              padding: EdgeInsets.all(context.space.space_300), 
              child: Column(
                children: [
                  AppTextField(
                    hintText: context.l10n.enterName,
                  ),
                  SizedBox(
                    height: context.space.space_200,
                  ),
                  AppTextField(
                    hintText: context.l10n.addEmailID,
                  ),
                  SizedBox(
                    height: context.space.space_200,
                  ),
                  AppTextField(
                    hintText: context.l10n.enterPhoneNumber,
                  ),
                  SizedBox(
                    height: context.space.space_800 * 3,
                  ),
                  ButtonWhite(
                    name: context.l10n.save,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
