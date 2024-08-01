// lib/dashed_line_widget.dart

import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/_dashed_line_painter.dart';

class DashedLineWidget extends StatelessWidget {
  final double width;
  final Color color;

  const DashedLineWidget(
      {super.key, this.width = double.infinity, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
      child: CustomPaint(
        size: Size(width, 1),
        painter: DashedLinePainter(
          color: color,
        ),
      ),
    );
  }
}
