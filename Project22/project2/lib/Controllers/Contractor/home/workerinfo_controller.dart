// lib/Controllers/Contractor/worker_details_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/User/request/rating_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class WorkerInfoController extends GetxController {
  WorkerModel? workerModel;
  List rateingData = [];

  late String inquiryStatus;
  String? username;

  RatingWorkerData ratingWorkerData = RatingWorkerData(Get.find());

  @override
  void onInit() {
    initialWorkerData();
    getRating();
    super.onInit();
  }

  ratingScore(String rate) {
    if (rate == '1') {
      return const Row(
        children: [Icon(Icons.star, size: 14, color: Appcolors.black)],
      );
    } else if (rate == '2') {
      return const Row(
        children: [
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black)
        ],
      );
    } else if (rate == '3') {
      return const Row(
        children: [
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black)
        ],
      );
    } else if (rate == '4') {
      return const Row(
        children: [
          Icon(
            Icons.star,
            size: 14,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Appcolors.black,
          ),
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black)
        ],
      );
    } else if (rate == '5') {
      return const Row(
        children: [
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black),
          Icon(Icons.star, size: 14, color: Appcolors.black),
        ],
      );
    }
  }

  initialWorkerData() {
    workerModel = Get.arguments['workerModel'];
  }

  getRating() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await ratingWorkerData.viewRating(workerModel!.userName!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        rateingData = request['input'];
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
