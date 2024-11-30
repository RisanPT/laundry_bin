import 'package:flutter/material.dart';
import 'package:laundry_bin/core/widgets/cached_image_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const ShimmerImage({
    super.key,
    required this.imageUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: height,
            color: Colors.grey[300], 
          ),
        ),
        CachedImage(
          imageUrl: imageUrl,
          height: height,
          width: double.infinity,
        )
      ],
    );
  }
}
