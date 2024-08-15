import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.colors.chatbox),
      child: IconButton(
          onPressed: () {}, icon: SvgPicture.asset(Assets.images.imgChat)),
    );
  }
}