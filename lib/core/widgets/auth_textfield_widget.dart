import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

///Textfield for register,login pages

class AppTextField extends HookWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? hintText;
  final bool isnumberkeyboard;
  const AppTextField({
    this.onChanged,
    this.obscureText = false,
    this.isnumberkeyboard = false,
    this.controller,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordHidden = useState(true);

    void toggleShowPassword() {
      isPasswordHidden.value = !isPasswordHidden.value;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.hintTxt, width: 1),
        borderRadius: BorderRadius.circular(context.space.space_400),
        color: context.colors.white,
      ),
      height: context.space.space_600,
      width: double.infinity,
      child: TextField(
        onChanged: onChanged,
        keyboardType:
            isnumberkeyboard ? TextInputType.number : TextInputType.text,
        controller: controller,
        maxLines: 1,
        autocorrect: false,
        obscureText: obscureText ? isPasswordHidden.value : false,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? GestureDetector(
                  onTap: toggleShowPassword,
                  child: SizedBox(
                    width: context.space.space_400,
                    child: Center(
                      child: SizedBox(
                        height: context.space.space_250,
                        width: context.space.space_250,
                        child: SvgPicture.asset(
                          isPasswordHidden.value
                              ? Assets.icons.icInvisibleEye
                              : Assets.icons.icVisibleEye,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(
              left: context.space.space_400, top: context.space.space_300),
          hintText: hintText,
          hintStyle: TextStyle(color: context.colors.hintTxt),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
        ),
      ),
    );
  }
}
