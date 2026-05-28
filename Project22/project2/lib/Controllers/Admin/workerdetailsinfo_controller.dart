import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Admin/acceptworker_data.dart';
import 'package:project2/Model/data/Admin/deleteworker_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class WorkerDetailsInfoController extends GetxController {
  late WorkerModel workerModel;
  late String inquiryStatus;
  WorkerAccept workerAccept = WorkerAccept(Get.find());
  WorkerDelete workerDelete = WorkerDelete(Get.find());

  initialWorkerData() {
    workerModel = Get.arguments['workerModel'];
  }

  @override
  void onInit() {
    initialWorkerData();
    super.onInit();
  }

  acceptWorkerWithinSystem() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await workerAccept.acceptWorker(workerModel.workerEmail!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.defaultDialog(
            title: "Confirm",
            middleText: "The worker will be accepted within the application",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "Confirm",
            buttonColor: Appcolors.primaryColor);
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The worker has already been accepted",
            middleTextStyle: TextStyle(fontSize: 17),
            contentPadding: EdgeInsetsGeometry.lerp(
                EdgeInsets.all(20), EdgeInsets.all(20), 4));
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  deletWorker() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await workerDelete.deleteWorker(workerModel.userName!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.defaultDialog(
            title: "Confirm",
            middleText: "The worker will be deleted from the application",
            middleTextStyle: TextStyle(fontSize: 17),
            onConfirm: () {
              Get.offAllNamed("adminfirstpage");
            },
            textConfirm: "Confirm",
            buttonColor: Appcolors.primaryColor);
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
