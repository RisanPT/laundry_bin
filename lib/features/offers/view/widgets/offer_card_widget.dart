import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String imagepath;
  final String description;
  final String? minOrderValue;
  final String? maxApplyCount;
  final String startDate;
  final String endDate;

  const OfferCard({
    super.key,
    required this.title,
    required this.imagepath,
    required this.description,
    this.minOrderValue,
    this.maxApplyCount,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.space.space_200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imagepath.endsWith('.svg')
              ? SvgPicture.file(
                  File(imagepath),
                  width: double.infinity,
                  height: context.space.space_900 * 2.5,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imagepath,
                  width: double.infinity,
                  height: context.space.space_900 * 2.5,
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: EdgeInsets.all(context.space.space_150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.typography.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primaryTxt,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: context.typography.bodyMedium.copyWith(
                    color: context.colors.primaryTxt.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Start Date: $startDate',
                  style: context.typography.bodySmall.copyWith(
                    color: context.colors.primaryTxt.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'End Date: $endDate',
                  style: context.typography.bodySmall.copyWith(
                    color: context.colors.primaryTxt.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: context.space.space_100),
                if (minOrderValue != null)
                  Text(
                    "Min Order Value: $minOrderValue",
                    style: context.typography.bodySmall.copyWith(
                      color: context.colors.primaryTxt.withOpacity(0.7),
                    ),
                  ),
                if (maxApplyCount != null)
                  Padding(
                    padding: EdgeInsets.only(top: context.space.space_100),
                    child: Text(
                      "Max Apply Count: $maxApplyCount",
                      style: context.typography.bodySmall.copyWith(
                        color: context.colors.primaryTxt.withOpacity(0.7),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
