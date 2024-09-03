import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;


  const TextFieldWidget({
    this.onChanged,
    this.controller,
    super.key,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
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
