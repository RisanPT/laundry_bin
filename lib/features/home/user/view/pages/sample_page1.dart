import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PAGE 1",
          style: context.typography.h2,
        ),
      ),
    );
  }
}
