// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:laundry_bin/core/extension/theme_extension.dart';
// import 'package:laundry_bin/core/theme/extensions/applocalization_extension.dart';
// import 'package:laundry_bin/gen/assets.gen.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: context.colors.white,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildHeader(context),
//               _buildProfileInfo(context),
//               _buildActions(context),
//               _buildOptionsList(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       height: context.space.space_600 * 2,
//       width: double.infinity,
//       color: context.colors.profileBg,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: SvgPicture.asset(
//               Assets.images.profileBgImage,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: context.space.space_250,
//               top: context.space.space_500,
//             ),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 context.l10n.profile,
//                 style: context.typography.h2,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileInfo(BuildContext context) {
//     return Container(
//       height: context.space.space_600 * 2,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: context.colors.profileBg,
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(context.space.space_600),
//         ),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: context.space.space_200),
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: context.colors.white,
//                   width: 1.0,
//                 ),
//               ),
//               child: CircleAvatar(
//                 radius: context.space.space_400,
//                 backgroundColor: context.colors.background,
//                 child: SvgPicture.asset(Assets.icons.icCamera),
//               ),
//             ),
//           ),
//           SizedBox(width: context.space.space_125),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("John Doe", style: context.typography.h3),
//               Text("+91 8129812588", style: context.typography.bodySmallMedium),
//               InkWell(
//                 onTap: () {},
//                 child: Row(
//                   children: [
//                     Text(
//                       context.l10n.editProfile,
//                       style: TextStyle(color: context.colors.primary),
//                     ),
//                     SizedBox(width: context.space.space_50),
//                     SvgPicture.asset(
//                       Assets.icons.icEditPen,
//                       color: context.colors.primary,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActions(BuildContext context) {
//     return Container(
//       height: context.space.space_500 * 2,
//       width: double.infinity,
//       color: context.colors.profileBg,
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: context.colors.backgroundSubtle,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(context.space.space_500),
//           ),
//         ),
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: context.colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(context.space.space_500),
//               bottomRight: Radius.circular(context.space.space_500),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildAction(context, Assets.images.imgShirtProfilePage,
//                   context.l10n.history),
//               _buildAction(context, Assets.icons.icContactUsProfilePage,
//                   context.l10n.contactUs),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAction(BuildContext context, String asset, String label) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         width: context.space.space_700 * 3,
//         height: context.space.space_700,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(context.space.space_800),
//           color: context.colors.background,
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: context.space.space_100),
//             SvgPicture.asset(asset),
//             SizedBox(width: context.space.space_100),
//             Text(
//               label,
//               style: context.typography.bodyLarge
//                   .copyWith(color: context.colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildOptionsList(BuildContext context) {
//   final options = [
//     _OptionData(Assets.icons.icDashboardProfilePage, context.l10n.dashboard),
//     _OptionData(Assets.icons.icAddressProfilePage, context.l10n.address),
//     _OptionData(Assets.icons.icFAQProfilePage, context.l10n.faq),
//     _OptionData(Assets.icons.icAboutusProfilePage, context.l10n.aboutUs),
//     _OptionData(Assets.icons.icReviewProfilePage, context.l10n.reviews),
//     _OptionData(
//         Assets.icons.icPrivacyPolicyProfilePage, context.l10n.privacyPolicy),
//   ];

//   return Container(
//     width: double.infinity,
//     color: context.colors.white,
//     child: Container(
//       width: double.infinity,
//       height: context.space.space_800 * 7,
//       decoration: BoxDecoration(
//         color: context.colors.backgroundSubtle,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(context.space.space_500)),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: context.space.space_300), // Added SizedBox here
//           ...options
//               .map((option) => [
//                     _buildOption(context, option),
//                     SizedBox(
//                         height: context.space.space_200), // Added SizedBox here
//                   ])
//               .toList()
//               .expand((element) => element),
//         ],
//       ),
//     ),
//   );
// }

// Widget _buildOption(BuildContext context, _OptionData option) {
//   return InkWell(
//     onTap: () {},
//     child: Container(
//       width: double.infinity,
//       height: context.space.space_500,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               SizedBox(width: context.space.space_300),
//               SvgPicture.asset(option.icon),
//               SizedBox(width: context.space.space_300),
//               Text(
//                 option.label,
//                 style: context.typography.bodyLargeMedium
//                     .copyWith(color: context.colors.primaryTxt),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: context.space.space_100),
//             child: SvgPicture.asset(Assets.icons.icArrowRightFAQ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// class _OptionData {
//   final String icon;
//   final String label;

//   _OptionData(this.icon, this.label);
// }
