import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primary,
              minimumSize: const Size(180, 50)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: context.colors.white),
              Text(
                text,
                style: context.typography.bodySemiBold
                    .copyWith(color: context.colors.white),
              ),
            ],
          )),
    );
  }
}
