import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/authentication/controller/auth_logout_controller/auth_logout_controller.dart';

class ShowAlertDialogue extends ConsumerWidget {
  const ShowAlertDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Are you sure you want to logout?",
            style: context.typography.bodySemiBold,
          ),
          SizedBox(
            height: context.space.space_300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "No",
                  style: context.typography.bodySemiBold
                      .copyWith(color: context.colors.warning),
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.read(authLogoutControllerProvider.notifier).logout();
                  Navigator.pop(context);
                },
                child: Text(
                  "Yes",
                  style: context.typography.bodySmallSemiBold
                      .copyWith(color: context.colors.primary),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
