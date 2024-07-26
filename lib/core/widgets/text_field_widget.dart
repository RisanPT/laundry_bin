import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;

  const TextFieldWidget({
    super.key,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
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
