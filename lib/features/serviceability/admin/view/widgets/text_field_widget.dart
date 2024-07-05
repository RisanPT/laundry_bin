import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class TextfieldServicesWidget extends StatelessWidget {
  const TextfieldServicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(context.space.space_150),
            child: SvgPicture.asset(
              Assets.icons.icSearchNormal,
              color: context.colors.containerShadow,
              height: 10,
              width: 10,
            ),
          ),
          prefixIconColor: context.colors.containerShadow,
          hintText: "Search",
          hintStyle: TextStyle(color: context.colors.containerShadow),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: context.colors.primary,
              ))),
    );
  }
}
