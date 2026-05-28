import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/profile/tracking_controller.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class WorkerTraking extends StatelessWidget {
  const WorkerTraking({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerTrakingController controller = Get.put(WorkerTrakingController());
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          const Center(
            child: CustomLargeText(
              text: "Accepted Requests",
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Appcolors.white,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: controller.markers.toSet(),
                initialCameraPosition: controller.cameraPosition!,
                onMapCreated: (GoogleMapController controllermap) {
                  controller.comcontroller = controllermap;
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
