import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/controller/image_cache_controller.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends ConsumerWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CachedImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref
            .read(imageCacheControllerProvider.notifier)
            .getCachedImage(imageUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image.memory(
              snapshot.data!,
              width: width,
              height: height,
              fit: BoxFit.cover,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Icon(Icons.error, color: context.colors.warning),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height,
                color: Colors.grey[300],
              ),
            );
          }
        });
  }
}
