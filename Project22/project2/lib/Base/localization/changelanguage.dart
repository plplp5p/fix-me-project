import 'dart:ui';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/handelingnotification.dart';
import 'package:project2/Base/services/myservices.dart';

class Changelanguage extends GetxController {
  Locale? languge;
  Myservices myservices = Get.find();

  changeLang(String appLang) {
    Locale locale = Locale(appLang);
    myservices.sharedPreferences.setString("lang", appLang);
    Get.updateLocale(locale);
  }

  requestLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Alert", "Please activate the location service");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Alert",
            "Please activate the location service for the application");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Alert",
          "The application cannot be used without activating the location service");
    }
  }

  requestNotificionPerm() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission status: granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Permission status: provisional');
    } else {
      print('Permission status: not accepted');
    }
  }

  @override
  void onInit() {
    handelNotification();
    requestNotificionPerm();
    requestLocation();
    String? applang = myservices.sharedPreferences.getString("lang");
    if (applang == "ar") {
      languge = const Locale("ar");
    } else if (applang == "en") {
      languge = const Locale("en");
    } else {
      languge = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
