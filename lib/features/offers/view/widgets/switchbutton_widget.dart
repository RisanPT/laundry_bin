import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class SwitchButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onPressed;
  final String text;
  const SwitchButton(
      {this.isSelected = true,
      required this.onPressed,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: !isSelected
              ? Border.all(color: context.colors.containerShadow)
              : null,
          color: isSelected ? context.colors.primary : context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_100),
        ),
        height: context.space.space_500,
        width: context.space.space_600 * 2,
        child: Center(
          child: Text(
            text,
            style: context.typography.bodyMedium.copyWith(
                color:
                    isSelected ? context.colors.white : context.colors.primary),
          ),
        ),
      ),
    );
  }
}
