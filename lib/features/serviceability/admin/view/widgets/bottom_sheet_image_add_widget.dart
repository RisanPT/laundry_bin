import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/img_add_container_widget.dart';

Future<dynamic> showDialogueImageAdd(BuildContext context) {
  return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 1.8,
          maxWidth: double.infinity),
      context: context,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: EdgeInsets.all(context.space.space_100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Cloth",
                  ),
                  const ImageSelctionWidget(),
                  Padding(
                    padding: EdgeInsets.only(left: context.space.space_300),
                    child: Text(
                      "Title",
                      style: context.typography.bodyLargeMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: context.colors.primary)),
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(context.colors.primary),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: context.typography.buttonTxt
                                .copyWith(color: context.colors.white),
                          )),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(context.colors.primary),
                        ),
                        onPressed: () {},
                        child: Text("Save",
                            style: context.typography.buttonTxt
                                .copyWith(color: context.colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
}
