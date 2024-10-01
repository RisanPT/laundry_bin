import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_150)),
      padding: EdgeInsets.all(context.space.space_200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.coupon,
            style: context.typography.bodyLargeSemiBold
                .copyWith(color: context.colors.primary),
          ),
          SizedBox(height: context.space.space_200),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.space.space_200),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.space.space_500,
                    vertical: 18.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.applyCode,
                  style: context.typography.body
                      .copyWith(color: context.colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
