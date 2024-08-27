import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';

class AvailableClothsSectionWidget extends HookConsumerWidget {
  const AvailableClothsSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final controllers = useState<List<TextEditingController>>([]);
    final clothControllers = ref.watch(allClothsProvider);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: switch (ref.watch(allClothsProvider)) {
          AsyncData(value: final cloths) => HookBuilder(builder: (context) {
              useEffect(() {
                if (clothControllers.hasValue && controllers.value.isEmpty) {
                  controllers.value = List<TextEditingController>.generate(
                      clothControllers.value!.length,
                      (_) => TextEditingController());
                }
                return () {
                  for (final controller in controllers.value) {
                    controller.dispose();
                  }
                };
              }, [clothControllers]);
              return ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: cloths.length,
                separatorBuilder: (context, index) => const SizedBox(height: 0),
                itemBuilder: (context, index) {
                  final cloth = cloths[index];
                  final controller = controllers.value[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.space.space_100,
                        horizontal: context.space.space_200),
                    child: Row(
                      children: [
                        Image.network(
                          cloth.image,
                          height: context.space.space_250 * 3,
                          width: context.space.space_250 * 3,
                        ),
                        SizedBox(width: context.space.space_200),
                        Expanded(
                          child: Text(
                            cloth.name,
                            style: context.typography.bodyMedium,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: context.space.space_900,
                          ),
                          child: TextFieldWidget(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            hintText: '\$0.00',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          AsyncError() => const Center(
              child: Text('ERROR'),
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            )
        });
  }
}
