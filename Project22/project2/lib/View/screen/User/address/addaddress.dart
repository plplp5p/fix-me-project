import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/address/addaddress_controller.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controlleradd = Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.primaryColor,
          title: Text(
            "Address".tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<AddAddressController>(builder: (controlleraddress) {
          return Column(children: [
            if (controlleradd.kGooglePlex != null)
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      markers: controlleraddress.myPlaces.toSet(),
                      onTap: (LatLng) {
                        controlleraddress.addNewPlace(LatLng);
                      },
                      initialCameraPosition: controlleraddress.kGooglePlex!,
                      onMapCreated: (GoogleMapController controller) {
                        controlleraddress.controller!.complete(controller);
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      child: InkWell(
                        onTap: () {
                          controlleraddress.goToAddressDetails();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 160,
                          
                          decoration: BoxDecoration(
                              color: Appcolors.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Continue".tr,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ]);
        }));
  }
}
