import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class TrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.space.space_100,
              ),
              Text(
                'Id: 152589',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.space.space_100,
              ),
              Image.asset('assets/images/image 4.png'),
              SizedBox(
                height: context.space.space_100,
              ),
              Text(
                '20 min',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Estimated Delivery Time',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: context.space.space_200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStatusItem(context,
                        color: context.colors.backgroundSubtle,
                        icon: Assets.icons.calendar,
                        date: 'Apr 03',
                        status: 'Scheduled',
                        height: context.space.space_150 * 2.5),
                    Padding(
                      padding:
                          EdgeInsets.only(left: context.space.space_50 * 7),
                      child: Container(
                        height: context.space.space_300,
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    _buildStatusItem(context,
                        color: Color(0xFFfff9e7),
                        icon: Assets.images.truck,
                        date: 'Apr 04',
                        status: 'Picked up',
                        height: context.space.space_250),
                    Padding(
                      padding:
                          EdgeInsets.only(left: context.space.space_50 * 7),
                      child: Container(
                        height: context.space.space_300,
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    _buildStatusItem(context,
                        color: context.colors.backgroundSubtle,
                        icon: Assets.images.washingMechineImg,
                        date: 'Apr 04',
                        status: 'Washing',
                        height: context.space.space_300),
                    Padding(
                      padding:
                          EdgeInsets.only(left: context.space.space_50 * 7),
                      child: Container(
                        height: context.space.space_300,
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    _buildStatusItem(context,
                        color: context.colors.backgroundSubtle,
                        icon: Assets.images.vector,
                        date: 'Apr 05',
                        status: 'Out for delivery',
                        height: context.space.space_250),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusItem(BuildContext context,
      {required String icon,
      required String date,
      required String status,
      required double height,
      required Color color}) {
    return Row(
      children: [
        Container(
          height: context.space.space_700,
          width: context.space.space_700,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: height,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              status,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
