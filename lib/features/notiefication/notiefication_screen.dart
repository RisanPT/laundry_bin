import 'package:flutter/material.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/features/notiefication/notieficatio_items.dart';

class NotieficationScreen extends StatelessWidget {
  const NotieficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.notifications,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          NotieficatioItems(
              icon: Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
              text: "Hello",
              subText: "dghgjdhgjhfjhsfd"),
          NotieficatioItems(
              icon: Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
              text: "Hello",
              subText: "dghgjdhgjhfjhsfd")
        ],
      ),
    );
  }
}
