import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/offers/view/widgets/offercard_shimmer_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/services_controller.dart';

class ServicesGridViewWidget extends ConsumerWidget {
  const ServicesGridViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncServices = ref.watch(getAllServicesProvider);

    return asyncServices.when(
        data: (services) {
          return GridView.builder(
              padding: EdgeInsets.all(context.space.space_300),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: context.space.space_200,
                  mainAxisSpacing: context.space.space_200,
                  crossAxisCount: 2),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => WashingPage(
                      //                 service: services[index],
                      //               )));
                    },
                    child: SevicesContainer(
                      service: services[index],
                    ),
                  ));
        },
        error: (error, stackTrace) => Center(
              child: Text("Error: $error"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class SevicesContainer extends StatelessWidget {
  final ServicesModel service;
  const SevicesContainer({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final imageUrl = service.image;
    return Container(
      height: context.space.space_100 * 18,
      width: context.space.space_100 * 18,
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_200)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.space.space_900,
              width: context.space.space_900,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.space.space_100),
                  child: ShimmerImage(
                      imageUrl: imageUrl, height: double.infinity)),
            ),
            SizedBox(
              height: context.space.space_150,
            ),
            Text(
              service.name,
              style: context.typography.bodySmallSemiBold,
            )
          ],
        ),
      ),
    );
  }
}
