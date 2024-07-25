import 'package:flutter/material.dart';

class ShowDialogueForAllEditing extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  const ShowDialogueForAllEditing({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    void showDialogModelForEditingh() async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: hintText,
                ),
              ),
              const SizedBox(height: 16),
              // TextField(
              //   controller: controller2,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(borderSide: BorderSide.none),
              //     hintText: "Enter number",
              //   ),
              // ),
            ],
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Edit"),
            ),
          ],
        ),
      );
    }

    return const Placeholder();
  }
}
