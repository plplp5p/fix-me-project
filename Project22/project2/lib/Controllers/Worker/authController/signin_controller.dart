import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/worker/auth/workersignup_data.dart';

class WorkerSignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController firstname;
  late TextEditingController cont_ema;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController lice;
  String? cat;
  late String inquiryStatus;
  WorkerSignupData workerSignupData = WorkerSignupData(Get.find());
  List data = [];

  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey3 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey4 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey5 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey6 = GlobalKey<FormState>();
  bool obscure = true;
  List wokerCategories = [];

  Myservices myservices = Get.find();

  List workerValues = [
    "Carpenter",
    "Driver",
    "Electrician",
    "Farmer",
    "Mason",
    "Mechanic",
    "Painter",
    "Plumber",
    "Welder"
  ];

  @override
  void onInit() {
    username = TextEditingController();
    lice = TextEditingController();
    firstname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    cont_ema = TextEditingController();
    getWorkerCategories();
    super.onInit();
  }

  onChangelicen(String val) {
    if (mykey1.currentState!.validate()) {
      lice.text = val;
    }
  }

  onChangeUsername(String val) {
    if (mykey2.currentState!.validate()) {
      username.text = val;
    }
  }

  onChangeFirstname(String val) {
    if (mykey3.currentState!.validate()) {
      firstname.text = val;
    }
  }

  onChangeEmail(String val) {
    if (mykey4.currentState!.validate()) {
      email.text = val;
    }
  }

  onChangePass(String val) {
    if (mykey5.currentState!.validate()) {
      password.text = val;
    }
  }

  onChangeContractorEmail(String val) {
    if (mykey6.currentState!.validate()) {
      cont_ema.text = val;
    }
  }

  showpassword() {
    obscure = !(obscure);
    update();
  }

  void chagecat(val) {
    cat = val;
    update();
  }

  @override
  void dispose() {
    lice.dispose();
    username.dispose();
    cont_ema.dispose();
    firstname.dispose;
    email.dispose();
    password.dispose();
    super.dispose();
  }

  bringData() async {
    if (email.text.isEmpty ||
        password.text.isEmpty ||
        firstname.text.isEmpty ||
        username.text.isEmpty ||
        lice.text.isEmpty ||
        cont_ema.text.isEmpty)
      return Get.snackbar("Alert", "Please fill in the fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await workerSignupData.getData(lice.text, username.text,
        firstname.text, email.text, cont_ema.text, password.text, cat!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        myservices.sharedPreferences.setString("workerusername", username.text);
        myservices.sharedPreferences
            .setString("workerfirstname", firstname.text);
        Get.toNamed("workerverifycodesign", arguments: {"email": email.text});
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
  }

  getWorkerCategories() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await workerSignupData.getcategories();
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        wokerCategories.addAll(request['input']);
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  gtToFirstPage() {
    Get.offAllNamed("/");
  }

  goTologin() {
    Get.offNamed("workerlogin");
  }

  goToVerifyCodeSign() {
    Get.offAllNamed("workerverifycodesign");
  }
}
