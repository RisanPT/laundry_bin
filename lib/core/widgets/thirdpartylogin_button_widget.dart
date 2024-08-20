import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

/// Button for register and login pages
class ThirdpartyloginButton extends HookWidget {
  final String name;
  final VoidCallback? onTap;
  final double width;
  final Color? color;
  final Color? hintTextcolor;
  final Widget? prefixIcon;

  const ThirdpartyloginButton({
    this.name = "Continue with Phone number",
    this.color,
    this.hintTextcolor,
    this.onTap,
    this.width = double.infinity,
    super.key,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) => isPressed.value = false,
      onTapCancel: () => isPressed.value = false,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: context.space.space_600,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.white),
          borderRadius: BorderRadius.circular(context.space.space_400),
          color: isPressed.value
              ? context.colors.white.withOpacity(0.4)
              : color ?? context.colors.white,
        ),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                height: context.space.space_300,
                width: context.space.space_300,
                child:
                    prefixIcon ?? SvgPicture.asset(Assets.icons.icGoogleWhite),
              ),
              SizedBox(
                width: context.space.space_200,
              ),
              Text(
                name,
                style: context.typography.bodyLargeMedium
                    .copyWith(color: hintTextcolor ?? context.colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
