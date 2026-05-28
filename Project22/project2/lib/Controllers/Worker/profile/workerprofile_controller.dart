import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/localization/changelanguage.dart';
import 'package:project2/Base/services/myservices.dart';

class WorkerProfileController extends GetxController {
  String? language;
  Changelanguage c = Get.find();
  late String inquiryStatus;
  Myservices myservices = Get.find();
  String? username;
  String? firstname;
  String? email;

  @override
  void onInit() {
    initalUser();
    super.onInit();
  }

  initalUser() {
    username = myservices.sharedPreferences.getString("workerusername");
    firstname = myservices.sharedPreferences.getString("workerfirstname");
  }

  chageArabic() {
    c.changeLang("ar");
    update();
  }

  changeEnglish() {
    c.changeLang("en");
    update();
  }

  logout() {
    Get.defaultDialog(
        title: "$firstname",
        titleStyle: const TextStyle(fontSize: 22),
        middleText: "Do you really want to logout from 'Fix me' ?",
        middleTextStyle: const TextStyle(fontSize: 18),
        contentPadding: const EdgeInsets.all(15),
        onCancel: () {
          Get.back();
        },
        onConfirm: () {
          myservices.sharedPreferences.clear();
          FirebaseMessaging.instance.unsubscribeFromTopic("users$username");
          Get.offAllNamed("contractorlogin");
        },
        textConfirm: "Confirm",
        buttonColor: Appcolors.primaryColor);
  }

  goToEditProfilePage() {
    Get.toNamed("workereditprofile", arguments: {
      "email": myservices.sharedPreferences.getString("workeremail"),
      "username": myservices.sharedPreferences.getString("workerusername"),
      "firstname": myservices.sharedPreferences.getString("workerfirstname"),
      "city": myservices.sharedPreferences.getString("workercity"),
      "zip": myservices.sharedPreferences.getString("workerzip"),
      "street": myservices.sharedPreferences.getString("workerstreet"),
    });
  }

  goToAcceptedReq() {
    Get.toNamed("Acceptrequest");
  }
}
