import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: context.typography.bodySemiBold,
      ),
    );
  }
}
