import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/worker/profile/workereditprofile_data.dart';

class WorkerEditprofileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController street = TextEditingController();

  String? username;
  Myservices myservices = Get.find();
  WorkerEditProfileData workerEditProfileData =
      WorkerEditProfileData(Get.find());
  late String inquiryStatus;

  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();

  intial() {
    email.text = Get.arguments['email'] ?? '';
    username = Get.arguments['username'] ?? "";
    firstname.text = Get.arguments['firstname'] ?? "";
    city.text = Get.arguments['city'] == "none" ? "" : Get.arguments['city'];
    zip.text = Get.arguments['zip'] == "none" ? "" : Get.arguments['zip'];
    street.text =
        Get.arguments['street'] == "none" ? "" : Get.arguments['street'];
  }

  @override
  void onInit() {
    intial();
    super.onInit();
  }

  onChangeusername(String val) {
    if (mykey1.currentState!.validate()) {
      email.text = val;
    }
  }

  editData() async {
    if (email.text.isEmpty || firstname.text.isEmpty) {
      return Get.snackbar("Alert", "Username and First Name cannot be empty");
    }
    inquiryStatus = InquiryStatus.lodaing;
    var request = await workerEditProfileData.workerEditData(username!,
        firstname.text, city.text, zip.text, street.text, email.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        myservices.sharedPreferences.setString("workeremail", email.text);
        myservices.sharedPreferences
            .setString("workerfirstname", firstname.text);
        myservices.sharedPreferences.setString("workercity", city.text);
        myservices.sharedPreferences.setString("workerstreet", street.text);
        myservices.sharedPreferences.setString("workerzip", zip.text);
        Get.offAllNamed("workerhome");
        print("success");
      } else if (request['status'] == "failure" &&
          request["message"] == "User found") {
        Get.snackbar("Error", "User Found");
      } else {
        Get.offAllNamed("workerhome");
      }
      return InquiryStatus.sereverFailure;
    }
    update();
  }
}
