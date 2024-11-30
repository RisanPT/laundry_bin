import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.space.space_600 * 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.profileBg,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(context.space.space_600),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.space.space_200),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colors.white,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: context.space.space_400,
                backgroundColor: context.colors.background,
                child: SvgPicture.asset(Assets.icons.icCamera),
              ),
            ),
          ),
          SizedBox(width: context.space.space_125),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Doe", style: context.typography.h3),
              Text("+91 8129812588", style: context.typography.bodySmallMedium),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      context.l10n.editProfile,
                      style: TextStyle(color: context.colors.primary),
                    ),
                    SizedBox(width: context.space.space_50),
                    SvgPicture.asset(
                      Assets.icons.icEditPen,
                      colorFilter: ColorFilter.mode(
                          context.colors.primary, BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
