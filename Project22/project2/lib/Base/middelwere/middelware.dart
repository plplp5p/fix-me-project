import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/services/myservices.dart';

class MyMiddelWare extends GetMiddleware {
  @override
  int get priority => 1;
  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
     if (myservices.sharedPreferences.getString("myMiddelWere") == "4") {
      return const RouteSettings(name: "/contractorhome");
    }
    if (myservices.sharedPreferences.getString("myMiddelWere") == "3") {
      return const RouteSettings(name: "/workerhome");
    }
    if (myservices.sharedPreferences.getString("myMiddelWere") == "2") {
      return const RouteSettings(name: "/userHome");
    }
    if (myservices.sharedPreferences.getString("myMiddelWere") == "1") {
      return const RouteSettings(name: "/userlogin");
    }
  }
}
