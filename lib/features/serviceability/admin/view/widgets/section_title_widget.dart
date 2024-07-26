import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const SectionTitleWidget({
    super.key,
    this.trailing,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.typography.bodySemiBold,
            ),
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}
