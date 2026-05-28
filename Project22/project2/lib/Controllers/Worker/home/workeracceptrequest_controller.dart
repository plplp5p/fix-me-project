import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Controllers/Worker/home/workerhome_controller.dart';
import 'package:project2/Controllers/Worker/profile/tracking_controller.dart';
import 'package:project2/Model/data/worker/home/acceptrequest_data.dart';
import 'package:project2/Model/model/User/customeraddressmodel.dart';
import 'package:project2/Model/model/Worker/requestmodel.dart';

class RequsedetalisinfoController extends GetxController {
  late RequestModel requestmodel;

  CutomerAddressModel? cutomerAddressModel;

  late String inquiryStatus;

  AcceptrequsetData requsetData = AcceptrequsetData(Get.find());

  Completer<GoogleMapController>? comcontroller;

  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  String? contractorEmail;

  Myservices myservices = Get.find();
  WorkerhomeController workerhomeController = Get.find();

  initalData() {
    contractorEmail =
        myservices.sharedPreferences.getString("workercontactoremail");
    requestmodel = Get.arguments['requestmodel'];
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(requestmodel.latitude!),
          double.parse(requestmodel.longitude!)),
      zoom: 8.4746,
    );
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(double.parse(requestmodel.latitude!),
            double.parse(requestmodel.longitude!))));
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  acceptReq() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await requsetData.getAcceptrequset(
        requestmodel.requestId!,
        contractorEmail!.replaceAll('@', '').replaceAll('.', ''),
        contractorEmail!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.offNamed("workerhome");
        workerhomeController.requestmodel
            .removeWhere((e) => e.requestId == requestmodel.requestId);
        WorkerTrakingController trakingController =
            Get.put(WorkerTrakingController());
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  rejectReq() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await requsetData.getRejectrequset(requestmodel.requestId!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        workerhomeController.requestmodel
            .removeWhere((e) => e.requestId == requestmodel.requestId);
        Get.offNamed("workerhome");
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
