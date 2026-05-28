import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Admin/adminlogin_data.dart';

class AdminloginController extends GetxController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool obscure = true;
  late String inquiryStatus;

  AdminloginData loginData = AdminloginData(Get.find());

  Myservices myservices = Get.find();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void onChangeEmail(String val) {
    if (mykey.currentState!.validate()) {
      email.text = val;
    }
  }

  void onChangepassword(String val) {
    if (mykey2.currentState!.validate()) {
      password.text = val;
    }
  }

  goToAdminHome() async {
    if (mykey.currentState!.validate()) {
      inquiryStatus = InquiryStatus.lodaing;
      var request = await loginData.loginData(email.text, password.text);
      inquiryStatus = respondingRequest(request);
      print(request);
      if (InquiryStatus.success == inquiryStatus) {
        if (request['status'] == "success") {
          Get.offAllNamed("adminfirstpage");
          myservices.sharedPreferences
              .setString("admin_id", request['input']['admin_id']);
          myservices.sharedPreferences
              .setString("admin_email", request['input']['admin_email']);
          myservices.sharedPreferences.setString("myMiddelWere", "2");
        } else {
          Get.defaultDialog(
              title: "Alert", middleText: "The account does not exist");
        }
      }
    }
  }

  showpassword() {
    obscure = !(obscure);
    update();
  }
}
