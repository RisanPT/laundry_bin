import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String imagepath;

  const OfferCard({super.key, required this.title, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SvgPicture.asset(
              imagepath), // ;Make sure to add images to assets folder
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}