import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/request/addrequest_data.dart';

class RequestController extends GetxController {
  late TextEditingController workerUsername;
  late TextEditingController cost;
  late TextEditingController service;
  String? username;
  Myservices myservices = Get.find();
  AddRequestData addRequestData = AddRequestData(Get.find());
  late String inquiryStatus;
  bool isNumber = true;
  String? reuestid;

  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();

  void onChangeUsername(String val) {
    if (mykey1.currentState!.validate()) {
      workerUsername.text = val;
    }
  }

  intailUsername() {
    username = myservices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    workerUsername = TextEditingController();
    cost = TextEditingController();
    service = TextEditingController();
    intailUsername();
    super.onInit();
  }

  @override
  void dispose() {
    workerUsername.dispose();
    cost.dispose();
    service.dispose();
    super.dispose();
  }

  goTocheckout() async {
    if (workerUsername.text.isEmpty ||
        cost.text.isEmpty ||
        service.text.isEmpty)
      return Get.snackbar("Alert", "Please complete the required fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await addRequestData.insertRequest(
        workerUsername.text, cost.text, service.text, username!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        reuestid = request["request_id"];
        Get.toNamed("checkoutpage", arguments: {"request_id": reuestid});
        workerUsername.clear();
        cost.clear();
        service.clear();
      } else {
        Get.snackbar("Alert", "Worker account does not exist");
        InquiryStatus.sereverFailure;
      }
      update();
    }
  }
}
