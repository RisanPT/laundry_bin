import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/serviceability/admin/domain/model/text_editing_controllers_model.dart';

import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/list_view_for_services_cloths_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/text_field_service_edit_tittle_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServiceDetailsPage extends HookConsumerWidget {
  const ServiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final priceEditController = useTextEditingController();

    final instructionsControllers = useState<List<TextEditingController>>([]);
    final priceControllers = useState<List<TextEditingController>>([]);
    final containers = useState<List<TextFieldContainer>>([]);

    void addContainer() {
      containers.value = [
        ...containers.value,
        TextFieldContainer(),
      ];
    }

    void addinstructions() {
      instructionsControllers.value = [
        ...instructionsControllers.value,
        TextEditingController(),
      ];
      priceControllers.value = [
        ...priceControllers.value,
        TextEditingController(),
      ];
    }

    final isEditing = useState(false);
    useMemoized(() {
      if (isEditing.value) {
        textController.selection = TextSelection.fromPosition(
            TextPosition(offset: textController.text.length));
      }
      return null;
    }, [isEditing.value]);

    return Scaffold(
        backgroundColor: context.colors.white,
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              const ImagePickerForServices(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Service Title",
                  style: context.typography.bodyLarge,
                ),
              ),
              TextFieldEditServiceTitle(
                textController: textController,
                isEditing: isEditing,
                hintText: context.l10n.ironing,
              ),
              ListViewBuilderServicesWidget(
                title: context.l10n.ironing,
                controller: priceEditController,
                icons: Assets.icons.icShirtWashingPage,
                price: "₹400",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.colors.chatbox,
                          border: Border.all(
                            color: context.colors.hintTxt,
                          )),
                      child: const Column(
                        children: [],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.space.space_100,
                  ),
                ]),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: containers.value.length,
                  itemBuilder: (context, index) {
                    final container = containers.value[index];
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: container.controller1,
                            decoration:
                                const InputDecoration(labelText: 'TextField 1'),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: container.controller2,
                            decoration:
                                const InputDecoration(labelText: 'TextField 2'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ])),
        // floatingActionButton: FloatingActionButton(
        //   shape: const BeveledRectangleBorder(
        //       borderRadius: BorderRadius(
        //           left: Radius.circular(20), right: Radius.circular(20))),
        //   backgroundColor: context.colors.primary,
        //   onPressed: addinstructions,
        //   child: const Text(
        //     "Add Instruction",
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: context.space.space_100 * 6.25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: context.colors.primary),
                  elevation: 0,
                  backgroundColor: context.colors.primary,
                  shape: ContinuousRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(context.space.space_250))),
              onPressed: addContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: context.colors.white,
                    size: context.space.space_250,
                  ),
                  SizedBox(
                    width: context.space.space_100,
                  ),
                  Text(
                    context.l10n.instruction,
                    style: TextStyle(
                      color: context.colors.primaryTxt,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// providers.dart
final instructionsProvider = StateProvider<List<String>>((ref) => []);
