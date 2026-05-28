import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/localization/changelanguage.dart';
import 'package:project2/Base/services/myservices.dart';

class ContractorProfileController extends GetxController {
  String? language;
  Changelanguage c = Get.find();
  late String inquiryStatus;
  Myservices myservices = Get.find();
  String? username;
  String? firstname;
  String? email;
  String? topicEmail;

  @override
  void onInit() {
    initalUser();
    super.onInit();
  }

  initalUser() {
    username = myservices.sharedPreferences.getString("contractorusername");
    firstname = myservices.sharedPreferences.getString("contractorfirstname");
    email = myservices.sharedPreferences.getString("workercontactoremail");
    topicEmail = email!.replaceAll('@', '').replaceAll('.', '');
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
          Get.offAllNamed("contractorlogin");
          FirebaseMessaging.instance
              .unsubscribeFromTopic("contrator${topicEmail}");
        },
        textConfirm: "Confirm",
        buttonColor: Appcolors.primaryColor);
  }

  goToEditProfilePage() {
    Get.toNamed("contractoreditprofile", arguments: {
      "email": myservices.sharedPreferences.getString("workercontactoremail"),
      "username": myservices.sharedPreferences.getString("contractorusername"),
      "firstname":
          myservices.sharedPreferences.getString("contractorfirstname"),
      "city": myservices.sharedPreferences.getString("contractorcity"),
      "zip": myservices.sharedPreferences.getString("contractorzip"),
      "street": myservices.sharedPreferences.getString("contractorstreet"),
    });
  }

  goToOngoingOrders() {
    Get.toNamed("ongoinorders");
  }
}
