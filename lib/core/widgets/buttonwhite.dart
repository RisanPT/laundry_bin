import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';

/// Button for register and login pages
class ButtonWhite extends HookWidget {
  final String? name;
  final VoidCallback? onTap;
  final double width;
  final Color? color;
  final Color? hintTextcolor;

  const ButtonWhite({
    this.name,
    this.color,
    this.hintTextcolor,
    this.onTap,
    this.width = double.infinity,
    super.key,
  });

  @override

  /// Builds a button widget with a white background color and a customizable name, color, and hint text color.
  ///
  /// The button widget is wrapped in an [AnimatedContainer] to animate its appearance when tapped.
  ///
  /// The [GestureDetector] widget is used to handle tap events and update the [isPressed] state.
  ///
  /// The button's appearance is determined by the [width], [color], and [hintTextColor] parameters.
  ///
  /// The [onTap] callback is called when the button is tapped.
  ///
  /// The [name] parameter is used as the text displayed on the button, or the default value 'register' is used if [name] is null.
  ///
  /// The [color] parameter is used as the background color of the button, or the default value 'white' is used if [color] is null.
  ///
  /// The [hintTextColor] parameter is used as the color of the text on the button, or the default value 'primary' is used if [hintTextColor] is null.
  ///
  /// Returns a [Widget] that represents the button.
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
          child: Text(
            name ?? context.l10n.register,
            style: context.typography.bodyLargeMedium
                .copyWith(color: hintTextcolor ?? context.colors.primary),
          ),
        ),
      ),
    );
  }
}
