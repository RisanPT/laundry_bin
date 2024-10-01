import 'package:flutter/material.dart';

class NotieficatioItems extends StatelessWidget {
  Icon icon;
  String text;
  String subText;
  NotieficatioItems(
      {super.key,
      required this.icon,
      required this.text,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: icon,
          ),
        ),
        title: Text(
          text,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subText,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
