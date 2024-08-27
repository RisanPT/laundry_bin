import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class BottomSheetForm extends HookWidget {
  final Map<String, String>? entryToEdit;
  final void Function(Map<String, String>) onSubmit;
  final VoidCallback onDelete;

  BottomSheetForm({
    Key? key,
    this.entryToEdit,
    required this.onSubmit,
    required this.onDelete,
  }) : super(key: key);

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
              decoration: InputDecoration(labelText: "Enter place"),
            ),
            TextField(
              controller: pinNumberController,
              decoration: InputDecoration(labelText: "Pin Number"),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: "Phone Number"),
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
                    child: Text('Delete'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
