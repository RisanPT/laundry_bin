import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ServicesGridViewClothContainerWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const ServicesGridViewClothContainerWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.space.space_100),
      child: GestureDetector(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(icon),
              Padding(
                padding: EdgeInsets.only(top: context.space.space_125),
                child: Text(
                  title,
                  style: context.typography.body,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
