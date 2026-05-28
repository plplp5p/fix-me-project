import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/localization/changelanguage.dart';
import 'package:project2/Base/services/myservices.dart';

class UserProfileController extends GetxController {
  String? language;
  Changelanguage c = Get.find();
  late String inquiryStatus;
  Myservices myservices = Get.find();
  String? username;
  String? firstname;

  @override
  void onInit() {
    initalUser();
    super.onInit();
  }

  initalUser() {
    username = myservices.sharedPreferences.getString("username");
    firstname = myservices.sharedPreferences.getString("customerfirstname");
  }

  chageArabic() {
    c.changeLang("ar");
    update();
  }

  changeEnglish() {
    c.changeLang("en");
    update();
  }

  goToaddress() {
    Get.toNamed("addresspage");
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
          Get.offAllNamed("userlogin");
          FirebaseMessaging.instance.unsubscribeFromTopic("users$username");
        },
        textConfirm: "Confirm",
        buttonColor: Appcolors.primaryColor);
  }

  goToMyOrdersPage() {
    Get.toNamed("myorderspage");
  }

  goToMyCompletedOrdersPage() {
    Get.toNamed("mycompletedorderspage");
  }
}
