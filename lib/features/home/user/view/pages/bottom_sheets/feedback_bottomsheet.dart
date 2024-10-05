import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class FeedbackBottomSheet extends StatelessWidget {
  const FeedbackBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      padding: EdgeInsets.all(context.space.space_250),
      height: context.space.space_700 * 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: context.space.space_100 * 40,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          Text(
            "How satisfied were you \n with your experience",
            style: context.typography.h3,
          ),
          const SizedBox(height: 20),
          const RatingWidget2(),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: context.colors.backgroundSubtle),
            child: Padding(
              padding: EdgeInsets.all(context.space.space_200),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your feedback here",
                ),
                maxLines: 6,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ButtonContainer(
            txt: "Submit",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;

  const ButtonContainer({required this.txt, super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.space.space_800,
        decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius: BorderRadius.circular(context.space.space_800)),
        child: Center(
            child: Text(
          txt,
          style: context.typography.bodySemiBold
              .copyWith(color: context.colors.white),
        )),
      ),
    );
  }
}

class RatingWidget2 extends HookWidget {
  const RatingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    final rating = useState(List.generate(5, (index) => false));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFecf3f6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                              : context.colors.white,
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
