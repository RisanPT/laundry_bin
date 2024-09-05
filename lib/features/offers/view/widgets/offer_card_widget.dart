import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String? imagepath;
  final String? description;
  final int? minOrderValue;
  final int maxApplyCount;
  final DateTime? startDate;
  final DateTime? endDate;
  final double offerTypeValue;
  final OfferType offerTypeEnum;

  const OfferCard({
    super.key,
    this.description,
    this.minOrderValue,
    this.startDate,
    this.endDate,
    required this.offerTypeValue,
    required this.offerTypeEnum,
    required this.title,
    this.imagepath,
    required this.maxApplyCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.space.space_200),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagepath != null
                ? Image.network(
                    imagepath!,
                    width: double.infinity,
                    height: context.space.space_900 * 2.5,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    Assets.images.imgWashingPage,
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
                    description!.isEmpty ? "no description" : description!,
                    style: context.typography.bodyMedium.copyWith(
                      color: context.colors.primaryTxt.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    startDate != null
                        ? 'Start Date: ${DateFormat('dd/MM/yyyy').format(startDate!)}'
                        : "no start date",
                    style: context.typography.bodySmall.copyWith(
                      color: context.colors.primaryTxt.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    endDate != null
                        ? 'End Date: ${DateFormat('dd/MM/yyyy').format(endDate!)}'
                        : "no end date",
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
                  Padding(
                    padding: EdgeInsets.only(top: context.space.space_100),
                    child: Text(
                      "Max Apply Count: $maxApplyCount",
                      style: context.typography.bodySmall.copyWith(
                        color: context.colors.primaryTxt.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.space.space_100),
                    child: Text(
                      "offerType: $offerTypeValue ${offerTypeEnum == OfferType.percentage ? "%" : "₹"}",
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
      ),
    );
  }
}
