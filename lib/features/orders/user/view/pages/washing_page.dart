import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/features/orders/user/controller/washing_provider.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/washing_bottom_bar.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/washing_items.dart';

class WashingPage extends ConsumerWidget {
  const WashingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: ListView(
                children: const [
                  // Example Laundry Items
                  WashingItems(
                    icon: Icon(
                      Icons.wash_outlined,
                      color: Colors.blueAccent,
                      size: 28,
                    ),
                    name: 'Shirt',
                    price: 20,
                  ),
                  WashingItems(
                    icon: Icon(
                      Icons.wash_outlined,
                      color: Colors.blueAccent,
                      size: 28,
                    ),
                    name: 'T-Shirt',
                    price: 30,
                  ),
                  WashingItems(
                    icon: Icon(
                      Icons.wash_outlined,
                      size: 28,
                      color: Colors.blueAccent,
                    ),
                    name: 'Jeans',
                    price: 50,
                  ),
                  // Add more LaundryItems as needed
                ],
              ),
            ),
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
