import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/features/home/user/controller/get_services_controller.dart';
import 'package:laundry_bin/features/orders/user/view/pages/washing_page.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/service_cloth_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

class ServicesGridViewWidget extends ConsumerWidget {
  const ServicesGridViewWidget({super.key});

  @override
<<<<<<< HEAD
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncServices = ref.watch(servicesStreamProvider);

    return asyncServices.when(
        data: (snapshot) {
          final servicesList = snapshot.docs.map((doc) => doc.data()).toList();
          if (servicesList.isEmpty) {
            return Center(
              child: Text("No services availabe"),
            );
          }
          return GridView.builder(
              padding: EdgeInsets.all(context.space.space_300),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: servicesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: context.space.space_200,
                  mainAxisSpacing: context.space.space_200,
                  crossAxisCount: 2),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WashingPage(
                                    service: servicesList[index],
                                  )));
                    },
                    child: SevicesContainer(
                      service: servicesList[index],
                    ),
                  ));
        },
        error: (error, stackTrace) => Center(
              child: Text("Error: $error"),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
=======
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(context.space.space_300),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: context.space.space_200,
            mainAxisSpacing: context.space.space_200,
            crossAxisCount: 2),
        itemBuilder: (context, index) => const SevicesContainer());
>>>>>>> 1188f5c315c0d52a5e5b8411f0143cf6f58d0feb
  }
}

class SevicesContainer extends StatelessWidget {
  final ServicesModel service;
  const SevicesContainer({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final imageUrl = service.image;
    final isNetworkImage= imageUrl.startsWith('http')||imageUrl.startsWith('https');  
    bool isFileExists=false;
    if(!isNetworkImage){
         try{
          isFileExists=File(imageUrl).existsSync();
          print('File exists: $isFileExists');
         }catch(e){
          print("Error checking file existence: $e");
         }
    }
    return Container(
      height: context.space.space_100 * 18,
      width: context.space.space_100 * 18,
      decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(context.space.space_200)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: context.space.space_900,
              width: context.space.space_900,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.space.space_100),
                  child:  isNetworkImage
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          print("Network image error: $error");
                          return Center(
                            child: Icon(Icons.broken_image,
                                size: 50, color: context.colors.grey),
                          );
                        },
                      )
                    : isFileExists
                        ? Image.file(
                            File(imageUrl),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print("File image error: $error");
                              return Center(
                                child: Icon(Icons.broken_image,
                                    size: 50, color: context.colors.grey),
                              );
                            },
                          )
                        : Center(
                            child: Icon(Icons.broken_image,
                                size: 50, color: context.colors.grey),
                          ),
              ),
            ),
            SizedBox(
              height: context.space.space_150,
            ),
            Text(
              service.name,
              style: context.typography.bodySmallSemiBold,
            )
          ],
        ),
      ),
    );
  }
}
