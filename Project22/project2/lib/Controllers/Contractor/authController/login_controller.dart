import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Contractor/auth/contractorlogin_data.dart';

class ContactorLoginController extends GetxController {
  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late String inquiryStatus;
  bool obscure = true;
  ContractorLoginData contractorLoginData = ContractorLoginData(Get.find());
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
    Get.offAllNamed("contractorforgetpassword");
  }

  goToSignIn() {
    Get.offNamed("contractorsignin");
  }

  goToHome() async {
    if (email.text.isEmpty || password.text.isEmpty )
      return Get.snackbar("Alert", "Please fill in the fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await contractorLoginData.contractorLoginData(
        email.text, password.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        if (request['input']['contractor_approve'] == "1") {
          Get.defaultDialog(
              title: "Alert",
              middleText: "Wait for the admin to approve your account",
              titleStyle: const TextStyle(
                  color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
              middleTextStyle: const TextStyle(fontSize: 17),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        } else if (request['input']['contractor_approve'] == "2") {
          if (int.parse(request['input']['user_attempts']) > 4) {
            Get.defaultDialog(
                title: "Alert",
                middleText: "You have exceeded the allowed number of attempts",
                titleStyle: const TextStyle(
                    color: Appcolors.black, fontWeight: FontWeight.bold),
                middleTextStyle: const TextStyle(fontSize: 17),
                confirm: MaterialButton(
                  onPressed: () {
                    Get.toNamed("contrctorreopenaccount");
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
                .setString("contractorusername", request["input"]["user_name"]);
            myservices.sharedPreferences.setString(
                "contractorfirstname", request["input"]["first_name"]);
            myservices.sharedPreferences.setString(
                "workercontactoremail", request["input"]["contactor_emial"]);
            myservices.sharedPreferences
                .setString("contractorcity", request["input"]["city"]);
            myservices.sharedPreferences
                .setString("contractorzip", request["input"]["zip"]);
            myservices.sharedPreferences
                .setString("contractorstreet", request["input"]["street"]);
            String conemail =
                myservices.sharedPreferences.getString("workercontactoremail")!;
            myservices.sharedPreferences.setString("myMiddelWere", "4");
            String sanitizedEmail =
                conemail.replaceAll('@', '').replaceAll('.', '');
            Get.offAllNamed("contractorhome");
            FirebaseMessaging.instance
                .subscribeToTopic("contrator${sanitizedEmail}");
          }
        } else {
          Get.snackbar("Alert", "Your account has not been confirmed yet",
              backgroundColor: Appcolors.white);
          Get.toNamed("workerverifycodesign", arguments: {"email": email.text});
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
                  Get.toNamed("contrctorreopenaccount");
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
    }
    update();
  }
}
