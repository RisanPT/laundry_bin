// import 'package:flutter/material.dart';
// import 'package:laundry_bin/core/extension/theme_extension.dart';

// class ProfileDetailsScreen extends StatefulWidget {
//   const ProfileDetailsScreen({Key? key}) : super(key: key);

//   @override
//   State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
// }

// class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.colors.backgroundSubtle,
//       appBar: AppBar(
//         backgroundColor: context.colors.backgroundSubtle,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back)),
//         title: Text(
//           "Profile Details",
//           style: context.typography.h2,
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: context.space.space_100,
//             ),
//             Center(
//               child: Container(
//                 width: context.space.space_100 * 12,
//                 height: context.space.space_100 * 12,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 2, color: context.colors.white),
//                   shape: BoxShape.circle,
//                   color: context.colors.background,
//                 ),
//                 child: Icon(
//                   Icons.camera_alt_outlined,
//                   color: context.colors.white,
//                   size: context.space.space_400,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: context.space.space_200,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: context.colors.secondaryTxt),
//                           borderRadius:
//                               BorderRadius.circular(context.space.space_400),
//                         ),
//                         hintText: "John Doe",
//                         hintStyle: TextStyle(
//                           color: context.colors.secondaryTxt,
//                         )),
//                   ),
//                   SizedBox(
//                     height: context.space.space_200,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: context.colors.secondaryTxt),
//                           borderRadius:
//                               BorderRadius.circular(context.space.space_400),
//                         ),
//                         labelText: "Add Email ID",
//                         labelStyle: TextStyle(
//                           color: context.colors.secondaryTxt,
//                         )),
//                   ),
//                   SizedBox(
//                     height: context.space.space_200,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: context.colors.white,
//                         borderRadius: BorderRadius.circular(context.space.space_400)),
//                     child: TextField(
//                       decoration: InputDecoration(
//                           fillColor: context.colors.white,
//                           border: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: context.colors.secondaryTxt),
//                             borderRadius:
//                                 BorderRadius.circular(context.space.space_400),
//                           ),
//                           hintText: "+91 8129862588",
//                           hintStyle: TextStyle(
//                             color: context.colors.secondaryTxt,
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSubtle,
      appBar: AppBar(
        backgroundColor: context.colors.backgroundSubtle,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
