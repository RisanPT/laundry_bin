// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:laundry_bin/core/extension/theme_extension.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/DateandtimePicker/datepicker.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/Summary/coupon_container.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/Summary/delivary_container.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/Summary/list_view_container.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/Summary/payment_container.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/Summary/reciept_card.dart';
// import 'package:laundry_bin/features/orders/user/view/widgets/Summary/summary_page_widget.dart';
// import 'package:laundry_bin/gen/assets.gen.dart';
// import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

// class SummaryPage extends HookWidget {
//   const SummaryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final entries = useState<List<Map<String, String>>>([]);

//     void showModalBottomSheet(BuildContext context,
//         [Map<String, String>? entryToEdit]) {
//       showModalBottomSheet(
//         context: context,
        
//         builder: (BuildContext context) {
//           return BottomSheetForm(
//             entryToEdit: entryToEdit,
//             onSubmit: (result) {
//               final newEntry = {
//                 'homeController': result['homeController'] ?? '',
//                 'placeController': result['placeController'] ?? '',
//                 'pinController': result['pinController'] ?? '',
//                 'phoneController': result['phoneController'] ?? '',
//               };

//               if (entryToEdit != null) {
//                 final index = entries.value.indexOf(entryToEdit);
//                 if (index != -1) {
//                   entries.value[index] = newEntry;
//                   entries.value = List.from(entries.value);
//                 }
//               } else {
//                 entries.value = [...entries.value, newEntry];
//               }
//             },
//             onDelete: () {
//               if (entryToEdit != null) {
//                 entries.value.remove(entryToEdit);
//                 entries.value = List.from(entries.value);
//               }
//             },
//           );
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: context.colors.backgroundSubtle,
//         title: Text(AppLocalizations.of(context)!.summary),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(context.space.space_150),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: context.colors.white,
//                   borderRadius: BorderRadius.circular(context.space.space_200),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             AppLocalizations.of(context)!.pickupPoint,
//                             style: context.typography.bodyLarge
//                                 .copyWith(color: context.colors.primary),
//                           ),
//                           IconButton(
//                             onPressed: () => showModalBottomSheet(context),
//                             icon: const Icon(Icons.add),
//                           ),
//                         ],
//                       ),
//                       ...entries.value.map((entry) {
//                         bool shouldDisplay =
//                             entry['homeController']?.isNotEmpty ?? false;

//                         return shouldDisplay
//                             ? Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                       context.space.space_50),
//                                   border:
//                                       Border.all(color: context.colors.grey),
//                                 ),
//                                 width: double.infinity,
//                                 margin: const EdgeInsets.only(top: 8.0),
//                                 child: Padding(
//                                   padding:
//                                       EdgeInsets.all(context.space.space_100),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             entry['homeController']
//                                                     ?.toUpperCase() ??
//                                                 '',
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           IconButton(
//                                             icon: SvgPicture.asset(
//                                                 Assets.icons.icEditPen),
//                                             onPressed: () {
//                                               showModalBottomSheet(
//                                                   context, entry);
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       Text(entry['placeController'] ?? ''),
//                                       Text(entry['pinController'] ?? ''),
//                                       Text(entry['phoneController'] ?? ''),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox();
//                       }),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: context.space.space_200,
//               ),
//               const DatePickerPage(),
//               SizedBox(
//                 height: context.space.space_200,
//               ),
//               const DeliveryOptions(),
//               SizedBox(
//                 height: context.space.space_200,
//               ),
//               const CouponCard(),
//               SizedBox(
//                 height: context.space.space_150,
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   height: context.space.space_200 * 13,
//                   child: const ListViewContainer()),
//               SizedBox(
//                 height: context.space.space_150,
//               ),
//               const ReceiptCard(),
//               SizedBox(
//                 height: context.space.space_150,
//               ),
//               const PaymentContainer()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
