import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/worker/auth/workerlogin_data.dart';

class WorkerLoginController extends GetxController {
  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late String inquiryStatus;
  bool obscure = true;
  WorkerLoginData workerLoginData = WorkerLoginData(Get.find());
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

  gtToFirstPage() {
    Get.offAllNamed("/");
  }

  goToForgetPassword() {
    Get.toNamed("workerforgetpassword");
  }

  goToSignIn() {
    Get.offNamed("workersignin");
  }

  goToHome() async {
    if (email.text.isEmpty || password.text.isEmpty )
      return Get.snackbar("Alert", "Please fill in the fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request =
        await workerLoginData.workerLoginData(email.text, password.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        if (request['input']['worker_approve'] == "1") {
          Get.defaultDialog(
              title: "Alert",
              middleText: "Wait for the admin to approve your account",
              titleStyle: const TextStyle(
                  color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
              middleTextStyle: const TextStyle(fontSize: 17),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        } else if (request['input']['worker_approve'] == "2") {
          if (int.parse(request['input']['user_attempts']) > 4) {
            Get.defaultDialog(
                title: "Alert",
                middleText: "You have exceeded the allowed number of attempts",
                titleStyle: const TextStyle(
                    color: Appcolors.black, fontWeight: FontWeight.bold),
                middleTextStyle: const TextStyle(fontSize: 17),
                confirm: MaterialButton(
                  onPressed: () {
                    Get.toNamed("workeremailreopenaccount");
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
                .setString("workerusername", request["input"]["user_name"]);
            String username =
                myservices.sharedPreferences.getString("workerusername")!;
            myservices.sharedPreferences
                .setString("workeremail", request["input"]["worker_email"]);
            myservices.sharedPreferences
                .setString("workerfirstname", request["input"]["first_name"]);
            myservices.sharedPreferences.setString(
                "workercontactoremail", request["input"]["contactor_email"]);
            myservices.sharedPreferences
                .setString("workercity", request["input"]["city"]);
            myservices.sharedPreferences
                .setString("workerzip", request["input"]["zip"]);
            myservices.sharedPreferences
                .setString("workerstreet", request["input"]["street"]);
            myservices.sharedPreferences.setString("myMiddelWere", "3");
            Get.offAllNamed("workerhome");
            FirebaseMessaging.instance.subscribeToTopic("users${username}");
          }
        } else {
          Get.snackbar("Alert", "Your account has not been confirmed yet",
              backgroundColor: Appcolors.white);
          Get.toNamed("workerverifycodesign", arguments: {"email": email.text});
        }
      }else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The account dose not exit",
            titleStyle: const TextStyle(
                color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(fontSize: 17),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        InquiryStatus.sereverFailure;
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
                  Get.toNamed("workeremailreopenaccount");
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
      }
      update();
    }
  }
}
