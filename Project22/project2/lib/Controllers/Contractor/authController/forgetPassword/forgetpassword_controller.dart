import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Contractor/auth/foregetpassword/contractorcheckemail_data.dart';


class ContrctorforgetpasswordController extends GetxController {
  GlobalKey<FormState> mykey22 = GlobalKey<FormState>();
  late TextEditingController email;
  ContrctorforgetpasswordData contrctorforgetpasswordData =
      ContrctorforgetpasswordData(Get.find());
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
    if (mykey22.currentState!.validate()) {
      email.text = val;
    }
  }

  goToVerifyCode() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request =
        await contrctorforgetpasswordData.getForgetpassData(email.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.toNamed("contractorverifycodepass", arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The account does not exist",
            titleStyle: const TextStyle(
                color: Appcolors.black, fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(fontSize: 17),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}