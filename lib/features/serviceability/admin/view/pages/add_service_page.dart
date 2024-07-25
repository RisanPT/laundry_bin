import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/widgets/text_field_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/available_cloths_section_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/section_title_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        title: const Text("Add Service"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
            child: Column(
              children: [
                SizedBox(height: context.space.space_200),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: context.space.space_100 * 40,
                    ),
                    child: const ImagePickerForServices(),
                  ),
                ),
                SizedBox(height: context.space.space_400),
                const SectionTitleWidget(title: 'Service Title'),
                SizedBox(height: context.space.space_200),
                const TextFieldWidget(
                  hintText: 'e.g: Washing',
                ),
                SizedBox(height: context.space.space_400),
                const SectionTitleWidget(title: 'Cloths Available'),
                SizedBox(height: context.space.space_200),
                const AvailableClothsSectionWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
