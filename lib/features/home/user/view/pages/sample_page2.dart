import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class SamplePage2 extends StatelessWidget {
  const SamplePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PAGE 2",
          style: context.typography.h2,
        ),
      ),
    );
  }
}
