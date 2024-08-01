import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ServicesGridViewContainerWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Widget? checkbox;
  const ServicesGridViewContainerWidget(
      {super.key, required this.title, required this.icon,required this.onTap,this.checkbox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.space.space_150, right: context.space.space_100),
      child: InkWell(
        onTap:onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
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
