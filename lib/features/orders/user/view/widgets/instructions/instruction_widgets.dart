import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/space_extension.dart';

class InstrucionPageContainer extends StatelessWidget {
  final String txt;

  final String icn;
  final bool isSelected;
  VoidCallback onTap;

  InstrucionPageContainer(
      {super.key,
      required this.icn,
      required this.txt,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final appSpaces = Theme.of(context).extension<AppSpaceExtension>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? context.colors.primary : Colors.transparent),
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Color(0xFFecf3f6),
                  shape: BoxShape.circle,
                ),
                child: SizedBox(
                  height: context.space.space_300,
                  child: Center(
                    child: SvgPicture.asset(
                      icn,
                      colorFilter: ColorFilter.mode(
                        isSelected ? Colors.white : Color(0xFFbaced9),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: appSpaces.space_200,
            ),
            Text(txt),
          ],
        ),
      ),
    );
  }
}
