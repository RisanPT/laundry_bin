import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class RatingWidget extends HookWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rating = useState(List.generate(5, (index) => false));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Rating',
              style:
                  context.typography.h3.copyWith(color: context.colors.primary),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.space.space_200,
                  vertical: context.space.space_100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return GestureDetector(
                      onTap: () {
                        rating.value[index] = !rating.value[index];
                        rating.value = List.from(rating.value);
                      },
                      child: SvgPicture.asset(
                        Assets.icons.star1,
                        colorFilter: ColorFilter.mode(
                          rating.value[index]
                              ? context.colors.primary
                              : const Color(0xFFe6f2f3),
                          BlendMode.srcIn,
                        ),
                      ));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
