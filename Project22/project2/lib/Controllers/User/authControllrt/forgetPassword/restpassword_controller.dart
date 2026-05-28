import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/User/auth/restpassword_data.dart';

class UserRestpasswordController extends GetxController {
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();

  late TextEditingController newpassword;
  late TextEditingController repassword;
  late String inquiryStatus;
  RestPasswordPassword restPasswordData = RestPasswordPassword(Get.find());
  bool obscureText = true;
  bool obscureText2 = true;

  String? email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    newpassword = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    repassword.dispose();
    super.dispose();
  }

  void onChangeNewPass(String val) {
    if (key1.currentState!.validate()) {
      newpassword.text = val;
    }
  }

  void onChangeRepatedPass(String val) {
    if (key2.currentState!.validate()) {
      repassword.text = val;
    }
  }

  showpassword() {
    obscureText = !(obscureText);
    update();
  }

  showpassword2() {
    obscureText2 = !(obscureText2);
    update();
  }

  goToSuuccessRestPass() async {
    if (newpassword.text == repassword.text) {
      inquiryStatus = InquiryStatus.lodaing;
      var request = await restPasswordData.getRestPasswordData(email!, newpassword.text);
      inquiryStatus = respondingRequest(request);
      print(request);
      if (InquiryStatus.success == inquiryStatus) {
        if (request['status'] == "success") {
          Get.offAllNamed("successrestpass");
        } else {
          InquiryStatus.sereverFailure;
        }
      }
      update();
    } else {
      Get.defaultDialog(
          title: "Alert",
          middleText: "The passwords have to match",
          titleStyle: const TextStyle(
              color: Appcolors.black, fontWeight: FontWeight.bold),
          middleTextStyle: const TextStyle(fontSize: 17),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
    }
  }
}
