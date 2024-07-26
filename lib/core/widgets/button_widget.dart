import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ButtonWidget extends StatelessWidget {
  final bool isDanger;
  final String label;

  /// Callback to execute when the button is clicked
  final VoidCallback onTap;

  const ButtonWidget({
    super.key,
    required this.label,
    required this.onTap,
  }) : isDanger = false;

  const ButtonWidget.danger({
    super.key,
    required this.label,
    required this.onTap,
  }) : isDanger = true;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = context.colors.primary;
    final textColor = context.colors.white;

    if (isDanger) {
      backgroundColor = context.colors.warning;
    }

    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        foregroundColor: WidgetStatePropertyAll(textColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.space.space_100),
          ),
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}
