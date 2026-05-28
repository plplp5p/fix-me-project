import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/auth/userlogin_data.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  UserLoginData userLoginData = UserLoginData(Get.find());
  late String inquiryStatus;
  bool obscure = true;

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
    if (mykey1.currentState!.validate()) {
      email.text = val;
    }
  }

  void onChangepassword(String val) {
    if (mykey2.currentState!.validate()) {
      password.text = val;
    }
  }

  showpassword() {
    obscure = !(obscure);
    update();
  }

  goToForegetPassword() {
    Get.offNamed("userforgetpassword");
  }

  goToSignIn() {
    Get.offNamed("usersignin");
  }

  gtToFirstPage() {
    Get.offAllNamed("/");
  }

  goToHome() async {
    if (email.text.isEmpty || password.text.isEmpty)
      return Get.snackbar("Alert", "Please fill in the fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await userLoginData.userLoginData(email.text, password.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        if (request['input']['customer_approve'] == "1") {
          if (int.parse(request['input']['user_attempts']) > 4) {
            Get.defaultDialog(
                title: "Alert",
                middleText: "You have exceeded the allowed number of attempts",
                titleStyle: const TextStyle(
                    color: Appcolors.black, fontWeight: FontWeight.bold),
                middleTextStyle: const TextStyle(fontSize: 17),
                confirm: MaterialButton(
                  onPressed: () {
                    Get.toNamed("useremailreOpenaccunt");
                  },
                  child: const Text(
                    "Open account",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
          } else {
            myservices.sharedPreferences
                .setString("username", request["input"]["user_name"]);
            String username =
                myservices.sharedPreferences.getString("username")!;
            myservices.sharedPreferences
                .setString("customeremail", request["input"]["customer_email"]);
            myservices.sharedPreferences
                .setString("customerfirstname", request["input"]["first_name"]);
            myservices.sharedPreferences.setString("myMiddelWere", "2");
            //
            Get.offNamed("userHome");

            FirebaseMessaging.instance.subscribeToTopic("users$username");
          }
        } else {
          Get.snackbar("Alert", "Your account has not been confirmed yet",
              backgroundColor: Appcolors.white);
          Get.toNamed("userverifycodesign", arguments: {"email": email.text});
        }
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The account dose not exit",
            titleStyle: const TextStyle(
                color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(fontSize: 17),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
      }
      if (request['status'] == "failure" &&
          request['message'] != "User not found") {
        if (int.parse(request['input']['user_attempts']) > 4) {
          Get.defaultDialog(
              title: "Alert",
              middleText: "You have exceeded the allowed number of attempts",
              titleStyle: const TextStyle(
                  color: Appcolors.black, fontWeight: FontWeight.bold),
              confirm: MaterialButton(
                onPressed: () {
                  Get.toNamed("useremailreOpenaccunt");
                },
                child: const Text(
                  "Open account",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              middleTextStyle: const TextStyle(fontSize: 17),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        }
        InquiryStatus.sereverFailure;
      }
    }
  }

  goToAdminlogin() {
    Get.offAllNamed("adminlogin");
  }
}
