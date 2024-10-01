import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/view/pages/order_details_page.dart';
import 'package:laundry_bin/features/home/user/view/pages/tracking_page.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class LaundryCard extends StatelessWidget {
  final Color statuscolor;
  final String price;
  final String name;
  final String img;
  LaundryCard(
      {required this.statuscolor,
      this.price = '',
      required this.name,
      required this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.space.space_50),
      margin: EdgeInsets.symmetric(vertical: context.space.space_75),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: context.space.space_100 * 15,
                  width: context.space.space_500 * 2,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: SizedBox(
                      height: context.space.space_400,
                      child: Center(child: SvgPicture.asset(img)))),
              SizedBox(width: context.space.space_200),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: context.space.space_300 * 4,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.space.space_100,
                          vertical: context.space.space_50,
                        ),
                        decoration: BoxDecoration(
                          color: statuscolor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          'On-going',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.space.space_100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Shirt', style: context.typography.bodySemiBold),
                          SizedBox(
                            width: context.space.space_100 * 23,
                          ),
                          Text('x2')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('T-Shirt',
                              style: context.typography.bodySemiBold),
                          SizedBox(
                            width: context.space.space_50 * 42,
                          ),
                          Text('x2')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Shorts',
                              style: context.typography.bodySemiBold),
                          SizedBox(
                            width: context.space.space_50 * 43,
                          ),
                          Text('x1')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: context.space.space_100),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '+2 Items',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: context.space.space_100,
          ),
          Row(
            children: [
              Center(
                child: Column(
                  children: [
                    Text('20 Dec 2024',
                        style: context.typography.bodySmallSemiBold),
                    Text(
                      price,
                      style: context.typography.body
                          .copyWith(color: context.colors.green),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: context.space.space_150,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailsPage()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFebfbfc),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Details',
                  style: TextStyle(
                    color: Color(0xFF34d5e5),
                  ),
                ),
              ),
              SizedBox(
                width: context.space.space_150,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrackingPage()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFebfbfc),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.space.space_400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Tracking',
                  style: TextStyle(
                    color: Color(0xFF34d5e5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
