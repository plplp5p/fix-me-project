import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/User/auth/userrestpassword_data.dart';

class UserForgetpasswordController extends GetxController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  late TextEditingController email;
  UserForgetpasswordData forgetpasswordData =
      UserForgetpasswordData(Get.find());
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
    var request = await forgetpasswordData.getForgetpassData(email.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.toNamed("userverifycodepass", arguments: {"email": email.text});
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
