import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class BottomSheetForm extends HookWidget {
  final Map<String, String>? entryToEdit;
  final void Function(Map<String, String>) onSubmit;
  final VoidCallback onDelete;

  const BottomSheetForm({
    super.key,
    this.entryToEdit,
    required this.onSubmit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final homeController =
        useTextEditingController(text: entryToEdit?['homeController'] ?? '');
    final placeController =
        useTextEditingController(text: entryToEdit?['placeController'] ?? '');
    final pinNumberController =
        useTextEditingController(text: entryToEdit?['pinController'] ?? '');
    final phoneNumberController =
        useTextEditingController(text: entryToEdit?['phoneController'] ?? '');

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: homeController,
              decoration: const InputDecoration(labelText: 'Home or Office'),
            ),
            TextField(
              controller: placeController,
              decoration: const InputDecoration(labelText: "Enter place"),
            ),
            TextField(
              controller: pinNumberController,
              decoration: const InputDecoration(labelText: "Pin Number"),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            SizedBox(
              height: context.space.space_75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onSubmit({
                      'homeController': homeController.text.toUpperCase(),
                      'placeController': placeController.text,
                      'pinController': pinNumberController.text,
                      'phoneController': phoneNumberController.text,
                    });
                  },
                  child: Text(entryToEdit != null ? 'Update' : 'Add'),
                ),
                SizedBox(
                  width: context.space.space_300,
                ),
                if (entryToEdit != null)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onDelete();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Delete'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
