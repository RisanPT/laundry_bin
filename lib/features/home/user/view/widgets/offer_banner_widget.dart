import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OfferBannerWidget extends StatelessWidget {
  final EdgeInsets padding;
  final double? height, width;
  final bool applyRadius;
  final String image;
  final Color? color;
  final bool isNetworkImg;
  const OfferBannerWidget({
    super.key,
    this.padding = EdgeInsets.zero,
    this.height,
    this.width,
    this.applyRadius = false,
    required this.image,
    this.isNetworkImg = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color,
          borderRadius: applyRadius
              ? BorderRadius.circular(context.space.space_200)
              : BorderRadius.circular(0),
        ),
      ),
    );
  }
}
