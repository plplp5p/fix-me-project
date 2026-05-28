import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/auth/usersignin_data.dart';

class SigninController extends GetxController {
  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey3 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey4 = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController firstname;
  late TextEditingController email;
  late TextEditingController password;
  bool obscure = true;

  Myservices myservices = Get.find();

  UserSigninData userSigninData = UserSigninData(Get.find());
  late String inquiryStatus;

  @override
  void onInit() {
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
    if (email.text.isEmpty || password.text.isEmpty || firstname.text.isEmpty || username.text.isEmpty)
      return Get.snackbar("Alert", "Please fill in the fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await userSigninData.userSignData(
        username.text, firstname.text, email.text, password.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        myservices.sharedPreferences.setString("username", username.text);
        myservices.sharedPreferences.setString("customeremail", email.text);
        myservices.sharedPreferences
            .setString("customerfirstname", firstname.text);
        Get.toNamed("userverifycodesign", arguments: {"email": email.text});
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

  goToLogIn() {
    Get.offNamed("userlogin");
  }

  goToContractoSignin() {
    Get.offNamed("contractorsignin");
  }

  gtToFirstPage() {
    Get.offAllNamed("/");
  }
}
