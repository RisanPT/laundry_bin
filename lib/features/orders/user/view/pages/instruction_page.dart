import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/theme/extensions/space_extension.dart';
import 'package:laundry_bin/features/orders/user/controller/instruction_provider.dart';
import 'package:laundry_bin/features/orders/user/view/pages/summary_page.dart';
import 'package:laundry_bin/features/orders/user/view/widgets/instruction_page_widget/instruction_page_container.dart';
import 'package:laundry_bin/gen/assets.gen.dart';
import 'package:laundry_bin/l10n/genarated/app_localizations.dart';

class InstructionPage extends ConsumerWidget {
  InstructionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waterIndex = ref.watch(waterProvider);
    final fabricIndex = ref.watch(fabricProvider);
    final detergentIndex = ref.watch(detergentProvider);

    final appSpaces = Theme.of(context).extension<AppSpaceExtension>()!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.backgroundSubtle,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.instruction),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(AppLocalizations.of(context)!.water),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InstrucionPageContainer(
                  isSelected: waterIndex == 0,
                  onTap: () => ref.read(waterProvider.notifier).state = 0,
                  icn: Assets.icons.iconHotHomescreen,
                  txt: AppLocalizations.of(context)!.hot),
              InstrucionPageContainer(
                  isSelected: waterIndex == 1,
                  onTap: () => ref.read(waterProvider.notifier).state = 1,
                  icn: Assets.icons.iconColdHomescreen,
                  txt: AppLocalizations.of(context)!.cold),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(AppLocalizations.of(context)!.fabricsoftener),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InstrucionPageContainer(
                  isSelected: fabricIndex == 0,
                  onTap: () => ref.read(fabricProvider.notifier).state = 0,
                  icn: Assets.icons.icTickCircle,
                  txt: AppLocalizations.of(context)!.yes),
              InstrucionPageContainer(
                  isSelected: fabricIndex == 1,
                  onTap: () => ref.read(fabricProvider.notifier).state = 1,
                  icn: Assets.icons.icCloseCircle,
                  txt: AppLocalizations.of(context)!.no),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(AppLocalizations.of(context)!.detergent),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InstrucionPageContainer(
                  isSelected: detergentIndex == 0,
                  onTap: () => ref.read(detergentProvider.notifier).state = 0,
                  icn: Assets.icons.icScented,
                  txt: AppLocalizations.of(context)!.scented),
              InstrucionPageContainer(
                  isSelected: detergentIndex == 1,
                  onTap: () => ref.read(detergentProvider.notifier).state = 1,
                  icn: Assets.icons.icNormalWind2,
                  txt: AppLocalizations.of(context)!.normal),
            ],
          ),
          Center(
            child: Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(appSpaces.space_100)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: AppLocalizations.of(context)!.enterNotes,
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SummaryPage()));
              },
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(appSpaces.space_500),
                  color: context.colors.primary,
                ),
                child: Center(
                    child: Text(
                  AppLocalizations.of(context)!.next,
                  style: context.typography.bodySemiBold
                      .copyWith(color: context.colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
