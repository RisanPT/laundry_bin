import 'package:flutter/material.dart';
import 'package:laundry_bin/features/orders/user/view/pages/instruction_page.dart';
// import 'package:laundry_bin/features/orders/user/view/pages/offer_page.dart';

class WashingBottomBar extends StatelessWidget {
  final int totalPrice;
  final int itemCount;

  const WashingBottomBar({
    required this.totalPrice,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InstructionPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .10,
        decoration: const BoxDecoration(color: Colors.white),
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * .011),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .01,
              left: MediaQuery.of(context).size.height * .01,
              right: MediaQuery.of(context).size.height * .01),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blueAccent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '  ₹$totalPrice',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  $itemCount Items',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text('Proceed',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
