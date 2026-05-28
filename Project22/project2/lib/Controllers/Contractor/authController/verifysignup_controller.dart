import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Contractor/auth/contractorverifycode_data.dart';

class ContrctorVerifycodesigninController extends GetxController {
  String? email;
  late String inquiryStatus;
  VerifycodesigninData verifycodesigninData = VerifycodesigninData(Get.find());

  initalEmail() {
    email = Get.arguments['email'];
  }

  @override
  void onInit() {
    initalEmail();
    super.onInit();
  }

  goToHomePage(String verfiycode) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request =
        await verifycodesigninData.verifycodesigninData(email!, verfiycode);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        print("sussess");
        Get.toNamed("contractorsuccesssigin");
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The verification code is invalid",
            titleStyle: const TextStyle(
                color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(fontSize: 17),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  resendverify() {
    print("sussess");
    verifycodesigninData.resndverifycode(email!);
  }
}
