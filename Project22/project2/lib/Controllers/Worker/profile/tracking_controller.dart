import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project2/Model/model/Worker/requestmodel.dart';

class WorkerTrakingController extends GetxController {
  late RequestModel requestmodel;
  StreamSubscription<Position>? positionStream;

  GoogleMapController? comcontroller;

  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  double? customserLatitude;
  double? customerLongitude;
  double? workerLatitude;
  double? workerLongitude;

  @override
  void onInit() {
    requestmodel = Get.arguments['requestmodel'];
    getGeoCoordinates();
    super.onInit();
  }

  getGeoCoordinates() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(requestmodel.latitude!),
          double.parse(requestmodel.longitude!)),
      zoom: 8.4746,
    );
    markers.add(Marker(
        markerId: const MarkerId("customer"),
        position: LatLng(double.parse(requestmodel.latitude!),
            double.parse(requestmodel.longitude!))));
    if (comcontroller != null) {
      comcontroller!.animateCamera(
          CameraUpdate.newLatLng(LatLng(workerLatitude!, workerLongitude!)));
    }
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      markers.removeWhere((e) => e.markerId.value == "worker");
      markers.add(Marker(
          markerId: const MarkerId("worker"),
          position: LatLng(position!.latitude, position.longitude)));
    });
  }
}
