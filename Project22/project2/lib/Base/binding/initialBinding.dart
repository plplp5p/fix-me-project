import 'package:get/get.dart';
import 'package:project2/Base/class/database.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Database());
  }
}
