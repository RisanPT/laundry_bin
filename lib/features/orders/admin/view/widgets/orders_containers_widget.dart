import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/orders/admin/view/widgets/chat_box_container.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class OrdersContainersWidget extends StatelessWidget {
  final String date;
  final String time;
  final String userName;
  final String orderId;
  List<String>? icons;
  final int itemCount;
  final double price;
  OrdersContainersWidget({
    super.key,
    required this.date,
    required this.time,
    required this.userName,
    required this.orderId,
    required this.itemCount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.space.space_100),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: -4,
                color: Color.fromARGB(68, 0, 0, 0),
              )
            ],
            color: context.colors.white),
        child: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: context.colors.secondaryTxt,
                      ),
                    ),
                    Text(time,
                        style: TextStyle(
                          color: context.colors.secondaryTxt,
                        )),
                  ]),
            ),
            Divider(
              color: context.colors.containerShadow,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: EdgeInsets.all(context.space.space_150),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/ic_user.png'),
                        Padding(
                          padding:
                              EdgeInsets.only(left: context.space.space_150),
                          child: Column(
                            children: [
                              Text(userName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: context.colors.primaryTxt,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                orderId,
                                style: TextStyle(
                                    color: context.colors.secondaryTxt),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const ChatContainer()
                  ]),
            ),
            Divider(
              color: context.colors.containerShadow,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    
                      decoration: BoxDecoration(
                        color: const Color(0xffE7F6FE),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            SvgPicture.asset(Assets.icons.icHoodiesWashingPage),
                      )),
                ),
              ),
            ),
            Divider(
              color: context.colors.containerShadow,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.space.space_300,
                  vertical: context.space.space_250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$itemCount Items",
                    style: TextStyle(color: context.colors.secondaryTxt),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: context.colors.secondaryTxt),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.space.space_125),
                        child: Text(
                          '₹${price.toString()}',
                          style: TextStyle(
                              color: context.colors.primaryTxt,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}


