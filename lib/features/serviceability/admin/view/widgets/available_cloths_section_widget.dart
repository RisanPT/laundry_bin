import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloths_model.dart';

class AvailableClothsSectionWidget extends HookConsumerWidget {
  final Map<String, double> initialPrices;
  final Function(String clothId, double newPrice) onPriceChanged;

  const AvailableClothsSectionWidget({
    Key? key,
    required this.initialPrices,
    required this.onPriceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allClothsAsync = ref.watch(allClothsProvider);

    return allClothsAsync.when(
      data: (cloths) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: cloths.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          itemBuilder: (context, index) {
            final cloth = cloths[index];
            final initialPrice = initialPrices[cloth.id] ?? 0.0;

            return ClothItem(
              cloth: cloth,
              initialPrice: initialPrice,
              onPriceChanged: onPriceChanged,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('ERROR: $error')),
    );
  }
}

class ClothItem extends HookConsumerWidget {
  final ClothsModel cloth;
  final double initialPrice;
  final Function(String clothId, double newPrice) onPriceChanged;

  const ClothItem({
    Key? key,
    required this.cloth,
    required this.initialPrice,
    required this.onPriceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceController = useTextEditingController(
      text: initialPrice.toStringAsFixed(2),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.space.space_100,
        horizontal: context.space.space_200,
      ),
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
              controller: priceController,
              onChanged: (value) {
                final newPrice = double.tryParse(value) ?? 0.0;
                onPriceChanged(cloth.id, newPrice);
              },
              keyboardType: TextInputType.number,
              hintText: '\$${initialPrice.toStringAsFixed(2)}',
            ),
          ),
        ],
      ),
    );
  }
}
