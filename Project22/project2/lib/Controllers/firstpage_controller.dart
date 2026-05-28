import 'package:get/get.dart';
import 'package:project2/Base/services/myservices.dart';

class FirstPageController extends GetxController {
  Myservices myservices = Get.find();
  goToUserSignIn() {
    Get.offNamed("usersignin");
    myservices.sharedPreferences.setString("myMiddelWere", "1");
  }
}
