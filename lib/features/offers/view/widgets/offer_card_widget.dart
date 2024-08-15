import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String imagepath;

  const OfferCard({
    required this.title,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imagepath.endsWith('.svg')
              ? SvgPicture.file(
                  File(imagepath),
                  width: double.infinity,
                  height: context.space.space_900 * 3,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imagepath,
                  width: double.infinity,
                  height: context.space.space_900 * 2,
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: context.typography.bodySemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
