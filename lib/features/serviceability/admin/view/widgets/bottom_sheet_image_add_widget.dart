import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
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
                    context.l10n.addCloths,
                    style: context.typography.h3
                        .copyWith(color: context.colors.primaryTxt),
                  ),
                ),
                const Center(child: ImagePickerForServices()),
                Padding(
                  padding: EdgeInsets.only(left: context.space.space_200),
                  child: Text(
                    context.l10n.instructionsTitle,
                    style: context.typography.bodyLargeSemiBold
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
                          hintText: context.l10n.textfieldTitle,
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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_100),
                  child: SizedBox(
                      width: double.infinity,
                      child: ButtonWidget(
                        label: context.l10n.save,
                        onTap: context.pop,
                      )),
                ),
                SizedBox(
                  height: context.space.space_100,
                )
              ],
            ),
          ),
        );
      });
}
