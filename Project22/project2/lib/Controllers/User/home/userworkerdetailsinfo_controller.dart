import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/chat/newchat_data.dart';
import 'package:project2/Model/data/User/request/rating_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';
import 'package:project2/textchat_controller.dart';

class UserWorkerDetailsInfoController extends GetxController {
  late String inquiryStatus;
  late WorkerModel workerModel;
  List rateingData = [];
  String? username;

  RatingWorkerData ratingWorkerData = RatingWorkerData(Get.find());
  NewChatData newChatData = NewChatData(Get.find());

  Myservices myservices = Get.find();

  intialData() {
    workerModel = Get.arguments['WorkerModel'];
    username = myservices.sharedPreferences.getString('username');
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

  @override
  void onInit() {
    intialData();
    getRating();
    super.onInit();
  }

  getRating() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await ratingWorkerData.viewRating(workerModel.userName!);
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

  contactWorker(String workerusername) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await newChatData.craeteNewChat(username!, workerusername);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.toNamed("chat1", arguments: {
          "chat_id": request['chatId'].toString(),
          "user_name": username,
          "worker_username": workerusername
        });
        var homechatController = Get.find<HomechatController>();
        homechatController.getdata();
      } else if (request["messege"] == "chat exit") {
        Get.toNamed("chat1", arguments: {
          "chat_id": request["data"][0]["chat_id"].toString(),
          "user_name": username,
          "worker_username": workerusername
        });
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
