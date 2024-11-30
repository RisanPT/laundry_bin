import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/view/widgets/offercard_shimmer_widget.dart';

class ServicesGridViewClothContainerWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const ServicesGridViewClothContainerWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.space.space_100),
      child: GestureDetector(
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0.5, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: SizedBox(
                  height: 100,
                  child: ShimmerImage(
                    imageUrl: icon,
                    height: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.space.space_100),
                child: Text(
                  title,
                  style: context.typography.body,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
