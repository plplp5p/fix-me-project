import 'package:get/get.dart';
import 'package:project2/Base/services/myservices.dart';

culomnLanguge(en, ar) {
  Myservices myservices = Get.find();
  if (myservices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
