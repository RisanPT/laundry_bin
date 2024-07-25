import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';

Future<dynamic> showDialogueImageAdd(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Add Cloths',
                    style: context.typography.h3
                        .copyWith(color: context.colors.primaryTxt),
                  ),
                ),
                const ImagePickerForServices(),
                Padding(
                  padding: EdgeInsets.only(left: context.space.space_200),
                  child: Text(
                    "Title",
                    style: context.typography.bodyLarge
                        .copyWith(color: context.colors.primaryTxt),
                  ),
                ),
                SizedBox(
                  height: context.space.space_100,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_200),
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Title Here",
                          hintStyle: context.typography.bodyMedium
                              .copyWith(color: context.colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: context.colors.primary,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: context.colors.primary,
                          )))),
                ),
                SizedBox(
                  height: context.space.space_150,
                ),
                GestureDetector(
                  onTap: context.pop,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.space.space_100),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: context.typography.h3
                              .copyWith(color: context.colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.space.space_200,
                )
              ],
            ),
          ),
        );
      });
}
