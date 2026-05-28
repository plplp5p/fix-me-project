import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AddAddressController extends GetxController {
  Completer<GoogleMapController>? controller;
  Position? myPostion;
  

  List<Marker> myPlaces = [];

  CameraPosition? kGooglePlex;

  double? latitude;
  double? longitude;

  @override
  void onInit() {
    controller = Completer<GoogleMapController>();
    postion();
    super.onInit();
  }

  addNewPlace(LatLng position) {
    myPlaces.add(Marker(markerId: MarkerId("1"), position: position));
    latitude = position.latitude;
    longitude = position.longitude;
    update();
  }

  postion() async {
    myPostion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(myPostion!.latitude, myPostion!.longitude),
      zoom: 14.4746,
    );
    update();
  }

  goToAddressDetails() {
    Get.offNamed("addressdetails", arguments: {
      "latitude": latitude.toString(),
      "longitude": longitude.toString()
    });
  }
}
