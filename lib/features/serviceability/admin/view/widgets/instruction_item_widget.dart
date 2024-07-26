import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/button_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/pages/add_service_page.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class InstrcutionItemWidget extends StatelessWidget {
  final ValueNotifier<List<InstructionTextEditingControllers>>
      allInstructionsControllers;

  const InstrcutionItemWidget({
    super.key,
    required this.allInstructionsControllers,
  });

  @override
  Widget build(BuildContext context) {
    /// Callback to excute when addding a new instruction
    void addNewInstructionBtnCallback() {
      final newInstrcutionControllers = InstructionTextEditingControllers(
        optionsControllers: [],
        titleController: TextEditingController(),
      );

      allInstructionsControllers.value = [
        ...allInstructionsControllers.value,
        newInstrcutionControllers
      ];
    }

    /// Callback to execute when removing an instruction
    void removeInstructionBtnCallback(int instructionIndex) {
      allInstructionsControllers.value = [...allInstructionsControllers.value]
        ..removeAt(instructionIndex);
    }

    /// Callback to execute to add a new option
    void addNewOptionBtnCallback(int instructionIndex) {
      final updatedInstructions = [...allInstructionsControllers.value];

      updatedInstructions[instructionIndex].optionsControllers.add(
            OptionTextEditingControllers(
              nameController: TextEditingController(),
              priceController: TextEditingController(),
            ),
          );

      allInstructionsControllers.value = [...updatedInstructions];
    }

    /// Callback to execute when removing an option
    void removeOptionCallback(int instructionIndex, int optionIndex) {
      final updatedInstructions = [...allInstructionsControllers.value];

      updatedInstructions[instructionIndex]
          .optionsControllers
          .removeAt(optionIndex);

      allInstructionsControllers.value = [...updatedInstructions];
    }

    return Column(
      children: [
        if (allInstructionsControllers.value.isEmpty)
          Container(
            padding: EdgeInsets.all(context.space.space_500),
            child: Center(
              child: Text(
                'No Instructions Added',
                style: context.typography.body
                    .copyWith(color: context.colors.hintTxt),
              ),
            ),
          )
        else
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: allInstructionsControllers.value.length,
              itemBuilder: (context, instructionIndex) {
                final currentInstruction =
                    allInstructionsControllers.value[instructionIndex];

                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(context.space.space_200),
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius:
                        BorderRadius.circular(context.space.space_100),
                    boxShadow: [context.shadow.offerContainerShadow],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitleWidget(title: 'Title'),
                      SizedBox(height: context.space.space_200),
                      const TextFieldWidget(
                        hintText: 'e.g: Water',
                      ),
                      SizedBox(height: context.space.space_300),
                      SectionTitleWidget(
                        title: 'Options',
                        trailing: IconButton(
                          onPressed: () =>
                              addNewOptionBtnCallback(instructionIndex),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      SizedBox(height: context.space.space_200),
                      Text('Tap and hold an option to remove it',
                          style: context.typography.bodySmall
                              .copyWith(color: context.colors.hintTxt)),
                      SizedBox(height: context.space.space_200),
                      if (currentInstruction.optionsControllers.isEmpty)
                        Container(
                          padding: EdgeInsets.all(context.space.space_500),
                          child: Center(
                            child: Text(
                              'Add an options to see it here',
                              style: context.typography.body
                                  .copyWith(color: context.colors.hintTxt),
                            ),
                          ),
                        )
                      else
                        ListView.separated(
                          itemCount:
                              currentInstruction.optionsControllers.length,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: context.space.space_200),
                          itemBuilder: (context, optionIndex) {
                            return GestureDetector(
                              onLongPress: () => removeOptionCallback(
                                  instructionIndex, optionIndex),
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: TextFieldWidget(
                                      hintText: 'Option Name',
                                    ),
                                  ),
                                  SizedBox(width: context.space.space_200),
                                  const Expanded(
                                    child: TextFieldWidget(
                                      hintText: '\$0.00',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      SizedBox(height: context.space.space_300),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonWidget.danger(
                          label: 'Remove Instruction',
                          onTap: () =>
                              removeInstructionBtnCallback(instructionIndex),
                        ),
                      )
                    ],
                  ),
                );
              }),

        /// Add new instruction button
        SizedBox(height: context.space.space_200),
        SizedBox(
          width: double.infinity,
          child: ButtonWidget(
            label: 'Add Instruction',
            onTap: addNewInstructionBtnCallback,
          ),
        ),
        SizedBox(height: context.space.space_400),
      ],
    );
  }
}
