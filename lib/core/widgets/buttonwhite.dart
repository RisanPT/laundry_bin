import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';

///Button for register and login pages

class ButtonWhite extends StatelessWidget {
  final String? name;
  final VoidCallback? onTap;
  final double width;
  final Color? color;
  final Color? hintTextcolor;

  const ButtonWhite({
    this.name,
    this.color,
    this.hintTextcolor,
    this.onTap,
    this.width = double.infinity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.space.space_600,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.white),
          borderRadius: BorderRadius.circular(context.space.space_400),
          color: color ?? context.colors.white,
        ),
        child: Center(
          child: Text(
            name ?? context.l10n.register,
            style: context.typography.bodyLargeMedium
                .copyWith(color: hintTextcolor ?? context.colors.primary),
          ),
        ),
      ),
    );
  }
}
