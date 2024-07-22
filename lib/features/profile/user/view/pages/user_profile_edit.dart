import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSubtle,
      appBar: AppBar(
        backgroundColor: context.colors.backgroundSubtle,
        title: Text(context.l10n.profileDetails),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(Assets.icons.icArrowLeft)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: context.space.space_400,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colors.white,
                    width: 2.0,
                  ),
                ),
                child: Stack(children: [
                  CircleAvatar(
                    radius: context.space.space_600,
                    backgroundColor: context.colors.background,
                    child: SvgPicture.asset(
                      Assets.images.imgShirtProfilePage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: 35,
                      right: 0,
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              Assets.icons.icEditPenEditProfile)))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stack(
//   children: [
//     CircleAvatar(
//       radius: 50,
//       backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/man-973591_960_720.jpg'), // Replace with actual profile image URL
//     ),
//     Positioned(
//       top: 35,
//       right: 0,
//       child: GestureDetector(
//         onTap: () {
//           // Handle edit action
//         },
//         child: CircleAvatar(
//           radius: 15,
//           backgroundColor: Colors.white,
//           child: Icon(Icons.edit, size: 18, color: Colors.black),
//         ),
//       ),
//     ),
//   ],
// )
