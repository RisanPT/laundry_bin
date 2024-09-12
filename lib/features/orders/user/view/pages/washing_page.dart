import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/features/orders/user/controller/washing_provider.dart';
import 'package:laundry_bin/features/orders/user/view/pages/instruction_page.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/washing_bottom_bar.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/washing_items.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloth_service_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/cloths_controller.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/service_storage.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';

class WashingPage extends ConsumerWidget {
  const WashingPage({super.key, required ServicesModel service});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCloths = ref.watch(allClothProviderr);
    final washingState = ref.watch(washingPro);
    // final washingNotifier = ref.read(washingPro.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 216, 255),
        elevation: 0,
        title: const Text(
          'Washing',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button action
          },
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 194, 216, 255),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 194, 216, 255)),
            child: SvgPicture.asset(
              'assets/images/img_washing-page.svg',
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * .02,
          //   decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(10),
          //           topRight: Radius.circular(10))),
          // ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .01),
                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: asyncCloths.when(
                    data: (cloths) => ListView.builder(
                        itemCount: cloths.length,
                        itemBuilder: (context, index) {
                          return WashingItems(
                            imageUrl: cloths[index].image,
                            icon: Icon(
                              Icons.wash_outlined,
                              color: Colors.blueAccent,
                              size: 28,
                            ),
                            name: cloths[index].name,
                            price: cloths[index].price ?? 0,
                          );
                        }),
                    error: (error, stack) =>
                        Center(child: Text('ERROR: $error')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()))),
          ),
          WashingBottomBar(
            totalPrice: washingState.totalPrice,
            itemCount: washingState.itemCount,
          ),
        ],
      ),
    );
  }
}
