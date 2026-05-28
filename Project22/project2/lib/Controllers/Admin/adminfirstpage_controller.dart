import 'package:get/get.dart';

class AdminfirstpageController extends GetxController {
  goToWorkerPage() {
    Get.toNamed("adminworkerpage");
  }

  goToContractorPage() {
    Get.toNamed("admincontractorpage");
  }
}
