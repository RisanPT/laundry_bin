import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/loading_indicator_widget.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';

class AvailableClothsSectionWidget extends HookConsumerWidget {
  const AvailableClothsSectionWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context, ref) {
    final allCloths = ref.watch(allClothsProvider);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: switch (allCloths) {
          AsyncData(value: final cloths) => HookBuilder(builder: (context) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: cloths.length,
                separatorBuilder: (context, index) => const SizedBox(height: 0),
                itemBuilder: (context, index) {
                  final cloth = cloths[index];
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
                            onChanged: (value) => ref
                                .read(servicesControllerProvider.notifier)
                                .setClothPrice(cloth.id, value),
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
              child: LoadingIndicator(),
            )
        });
  }
}
