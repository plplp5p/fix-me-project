import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/home/workeracceptrequest_controller.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    RequsedetalisinfoController controller =
      Get.put(RequsedetalisinfoController());
    return Column(
      children: [
        Card(
          color: Appcolors.white,
          child: ListTile(
            title: Text(
              "${controller.requestmodel.addressName}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            subtitle: Text("${controller.requestmodel.street}",
                style: const TextStyle(fontSize: 16)),
            trailing: Text("${controller.requestmodel.city}"),
          ),
        ), const SizedBox(height: 20),
            Card(
              child: Container(
                color: Appcolors.white,
                padding: const EdgeInsets.all(10),
                height: 350,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.comcontroller!.complete(controllermap);
                      },
                    ),
                  ],
                ),
              ),
            )
      ],
    );
  }
}
