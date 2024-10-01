import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/auth_textfield_widget.dart';
import 'package:laundry_bin/core/widgets/buttonwhite.dart';
import 'package:laundry_bin/features/profile/user/view/pages/profile_page.dart';
import 'package:laundry_bin/features/profile/user/view/widgets/bottomsheetwidget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSubtle,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.space.space_300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.space.space_300),
            _buildProfileAvatar(context),
            SizedBox(height: context.space.space_500),
            _buildProfileForm(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.backgroundSubtle,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(Assets.icons.icArrowLeft),
      ),
      title: Text(
        context.l10n.profileDetails,
        textAlign: TextAlign.center,
        style: context.typography.h2,
      ),
      centerTitle: true,
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.colors.white, width: 2.0),
            ),
            child: CircleAvatar(
              radius: context.space.space_500 + context.space.space_50,
              backgroundColor: context.colors.background,
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const CustomBottomSheet(),
              );
            },
            child: CircleAvatar(
              radius: context.space.space_200,
              backgroundColor: context.colors.white,
              child: SvgPicture.asset(
                Assets.icons.icEditPen,
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Column(
      children: [
        AppTextField(hintText: context.l10n.enterName),
        SizedBox(height: context.space.space_200),
        AppTextField(hintText: context.l10n.addEmailID),
        SizedBox(height: context.space.space_200),
        AppTextField(hintText: context.l10n.enterPhoneNumber),
        SizedBox(height: context.space.space_800 * 3.5),
        ButtonWhite(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          color: context.colors.primary,
          name: context.l10n.save,
          hintTextcolor: context.colors.white,
        ),
      ],
    );
  }
}
