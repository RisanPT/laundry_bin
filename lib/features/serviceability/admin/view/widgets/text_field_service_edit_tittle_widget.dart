import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class TextFieldEditServiceTitle extends StatelessWidget {
  const TextFieldEditServiceTitle({
    super.key,
    required this.textController,
    required this.isEditing,
    required this.hintText,
  });

  final TextEditingController textController;
  final ValueNotifier<bool> isEditing;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        textAlign: TextAlign.left,
        style: context.typography.h3,
        controller: textController,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            // contentPadding:
            //     EdgeInsets.symmetric(horizontal: context.space.space_400),
            hintText: hintText,
            hintStyle: context.typography.h3,
            suffixIcon: IconButton(
                onPressed: () {
                  isEditing.value = !isEditing.value;
                  if (isEditing.value) {
                    FocusScope.of(context).unfocus();
                  } else {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                icon: Icon(isEditing.value ? Icons.check : Icons.edit))),
        readOnly: !isEditing.value,
      ),
    );
  }
}
