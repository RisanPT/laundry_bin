import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';

class ServicesGridViewContainerWidget extends StatelessWidget {
  final String title;
  final String icon;
  const ServicesGridViewContainerWidget(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.space.space_150, right: context.space.space_100),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddServicePage(),
              ));
        },
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
