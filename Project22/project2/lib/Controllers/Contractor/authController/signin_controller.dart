import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Contractor/auth/contractorsignin_data.dart';

class ContactorSigninController extends GetxController {
  late TextEditingController username;
  late TextEditingController firstname;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController licenNum;

  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey3 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey4 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey5 = GlobalKey<FormState>();

  bool obscure = true;

  Myservices myservices = Get.find();

  late String inquiryStatus;

  ContractorSigninData contractorSigninData = ContractorSigninData(Get.find());

  gtToFirstPage() {
    Get.offAllNamed("/");
  }

  @override
  void onInit() {
    licenNum = TextEditingController();
    username = TextEditingController();
    firstname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    firstname.dispose;
    email.dispose();
    password.dispose();
    super.dispose();
  }

  onChangelicen(String val) {
    if (mykey5.currentState!.validate()) {
      licenNum.text = val;
    }
  }

  onChangeusername(String val) {
    if (mykey1.currentState!.validate()) {
      username.text = val;
    }
  }

  onChangeuFirstname(String val) {
    if (mykey2.currentState!.validate()) {
      firstname.text = val;
    }
  }

  onChangeEmail(String val) {
    if (mykey3.currentState!.validate()) {
      email.text = val;
    }
  }

  onChangeuserpass(String val) {
    if (mykey4.currentState!.validate()) {
      password.text = val;
    }
  }

  showpassword() {
    obscure = !(obscure);
    update();
  }

  goToVerifyCode() async {
    if (email.text.isEmpty || password.text.isEmpty || firstname.text.isEmpty || username.text.isEmpty || licenNum.text.isEmpty)
      return Get.snackbar("Alert", "Please fill in the fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await contractorSigninData.contractorSignData(licenNum.text,
        username.text, firstname.text, email.text, password.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        myservices.sharedPreferences
            .setString("contractorusername", username.text);
        myservices.sharedPreferences
            .setString("contractorfirstname", firstname.text);
        myservices.sharedPreferences.setString("workercontactoremail", email.text);
        String conemail =
            myservices.sharedPreferences.getString("workercontactoremail")!;
        myservices.sharedPreferences.setString("myMiddelWere", "4");
        String sanitizedEmail =
            conemail.replaceAll('@', '').replaceAll('.', '');
         FirebaseMessaging.instance.subscribeToTopic("contrator${sanitizedEmail}");
        Get.offNamed("contractorverifycodesign",
            arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The account is already registered",
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

  goToLogin() {
    Get.offNamed("contractorlogin");
  }

  goToWorkerSignIn() {
    Get.offAllNamed("workersignin");
  }
}
