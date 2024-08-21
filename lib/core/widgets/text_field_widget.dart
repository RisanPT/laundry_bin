import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const TextFieldWidget({
    this.controller,
    super.key,
    this.hintText,
     this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: context.typography.bodySmall
            .copyWith(color: context.colors.hintTxt),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary),
        ),
      ),
    );
  }
}
