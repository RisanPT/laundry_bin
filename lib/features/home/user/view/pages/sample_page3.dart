import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/widgets/show_alert_dialogue.dart';

class SamplePage3 extends StatelessWidget {
  const SamplePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PAGE 3",
          style: context.typography.h2,
        ),
        actions: [
          //a shortcut button to logout.this button only for development purpose.
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const ShowAlertDialogue());
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }
}
