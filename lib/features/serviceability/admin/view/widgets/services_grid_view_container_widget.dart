import 'package:flutter/material.dart';
import 'package:laundry_bin/features/offers/view/widgets/offercard_shimmer_widget.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ServicesGridViewContainerWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Checkbox? checkbox;

  const ServicesGridViewContainerWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.checkbox,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(context.space.space_100),
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_200),
          boxShadow: [
            BoxShadow(
              color: context.colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ShimmerImage(imageUrl: icon, height: double.infinity),
              ),
            ),

            if (checkbox != null)
              Positioned(
                top: context.space.space_100,
                right: context.space.space_100,
                child: checkbox!,
              ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(context.space.space_200),
                    bottomRight: Radius.circular(context.space.space_200),
                  ),
                ),
                padding: EdgeInsets.all(context.space.space_150),
                child: Text(
                  title,
                  style: context.typography.body.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
