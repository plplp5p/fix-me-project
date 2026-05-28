import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Contractor/auth/unblockaccount/contractorunblockaccont_data.dart';


class ContrctorreopenaccountController extends GetxController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  late TextEditingController email;
  ConrtctorreopenaccountData conrtctorreopenaccountData =
      ConrtctorreopenaccountData(Get.find());
  late String inquiryStatus;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  void onChangeEmail(String val) {
    if (mykey.currentState!.validate()) {
      email.text = val;
    }
  }

  goToVerifyCode() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await conrtctorreopenaccountData.getData(email.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.toNamed("contrctorverfiycodereopen",
            arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The verification code is invalid",
            titleStyle: const TextStyle(
                color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(fontSize: 17),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}