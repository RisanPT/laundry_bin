import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';


class ListViewBuilderServicesWidget extends StatelessWidget {
  final String title;
  final String price;
  final String icons;
  final TextEditingController controller;
  const ListViewBuilderServicesWidget({
    super.key,
    required this.title,
    required this.price,
    required this.icons,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.grey,
      child: SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (context, index) => ListTile(
            tileColor: context.colors.white,
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.colors.chatbox,
                ),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: context.colors.chatbox,
                    )),
                    child: SvgPicture.asset(icons))),
            title: Text(
              title,
              style: TextStyle(color: context.colors.primaryTxt),
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          content: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter Price",
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Text("Cancel")),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Save")),
                              ],
                            )
                          ]),
                    );
                  },
                  icon: const Icon(Icons.edit)),
              Text(
                price,
                style: context.typography.bodySemiBold,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
