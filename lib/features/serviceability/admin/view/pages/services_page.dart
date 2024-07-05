import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/text_field_widget.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.colors.white,
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 2,
                        ),
                        context: context,
                        builder: (context) => Container(
                              color: Colors.white,
                              child: Column(children: [
                                TextfieldServicesWidget(),
                                TextfieldServicesWidget()
                              ]),
                            ));
                  },
                  icon: Icon(Icons.add_sharp))
            ],
            title: Text(
              "Services",
              style: TextStyle(color: context.colors.primaryTxt),
            ),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: context.colors.primary,
                indicatorColor: context.colors.primary,
                labelStyle: context.typography.bodySemiBold,
                unselectedLabelStyle: context.typography.bodySmallSemiBold,
                tabs: [
                  Tab(
                    text: "Cloths",
                  ),
                  Tab(
                    text: "Services",
                  )
                ])),
        body: TabBarView(children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextfieldServicesWidget(),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(
                    height: context.space.space_100,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    tileColor: const Color(0xffE7F6FE),
                    leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(context.space.space_50),
                          child:
                              SvgPicture.asset(Assets.icons.icShirtWashingPage),
                        )),
                    title: Text(
                      "Shirts",
                      style: TextStyle(color: context.colors.primaryTxt),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextfieldServicesWidget(),
              ),
              SizedBox(
                height: 400,
                child: ListView.separated(
                  itemCount: 25,
                  separatorBuilder: (context, index) => SizedBox(
                    height: context.space.space_200,
                  ),
                  itemBuilder: (context, index) => Card(
                    elevation: 1,
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      title: Text(
                        "Shirts",
                        style: TextStyle(color: context.colors.primaryTxt),
                      ),
                      leading: Icon(Icons.usb_rounded),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("New"))
            ],
          ),
        ]),
      ),
    );
  }
}
