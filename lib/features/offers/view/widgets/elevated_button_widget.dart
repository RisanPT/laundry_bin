import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ElevatedButtonWidget extends HookWidget {
  final String text;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // useState is being used here correctly in a HookWidget
    final isPressed = useState(false);

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) => isPressed.value = false,
      onTapCancel: () => isPressed.value = false,
      onTap: onPressed,
      child: Container(
        // No animation, color changes instantly
        constraints: BoxConstraints(maxWidth: context.space.space_900 * 2.5),
        decoration: BoxDecoration(
          color: isPressed.value
              ? context.colors.primary.withOpacity(0.7)
              : context.colors.primary,
          borderRadius: BorderRadius.circular(context.space.space_400),
        ),
        child: SizedBox(
          width: 180,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: context.colors.white),
              const SizedBox(width: 8),
              Text(
                text,
                style: context.typography.bodySemiBold
                    .copyWith(color: context.colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
