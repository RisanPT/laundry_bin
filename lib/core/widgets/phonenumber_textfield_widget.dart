import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';

/// TextField for register, login pages
class Phonenumbertextfield extends HookWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const Phonenumbertextfield({
    this.onChanged,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onCountryChanged: (value) {
        onChanged!("+${value.dialCode}");
      },
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colors.white,
        hintText: context.l10n.enterPhoneNumber,
        hintStyle: TextStyle(color: context.colors.hintTxt),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {},
    );
  }
}
