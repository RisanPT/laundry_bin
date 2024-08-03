import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';

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

  /// Parameters:
  /// - [BuildContext context]: The build context.
  /// - [String title]: The title of the service.
  /// - [String icon]: The icon of the service.
  /// - [VoidCallback onTap]: The callback function to handle taps on the container.
  /// - [Widget? checkbox]: An optional widget representing a checkbox.
  ///
  /// Returns:
  /// A widget that displays a container for services in a grid view.
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.space.space_150, right: context.space.space_100),
      child: GestureDetector(
        onTap: onTap,
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: checkbox,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: context.space.space_100),
                    SvgPicture.asset(icon),
                    SizedBox(height: context.space.space_100),
                    Text(
                      title,
                      style: context.typography.body,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
