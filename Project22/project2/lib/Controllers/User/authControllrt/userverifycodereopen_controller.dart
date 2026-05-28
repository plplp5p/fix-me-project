import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/User/auth/userverfiycodereope_data.dart';


class UserVerifycodeReOpenAccountController extends GetxController {
  String? email;

  late String inquiryStatus;

  VerifyCodeReOpenAccountData reOpenAccountData =
      VerifyCodeReOpenAccountData(Get.find());

  initalEmail() {
    email = Get.arguments['email'];
  }

  @override
  void onInit() {
    initalEmail();
    super.onInit();
  }

   reOpenAccunt(String verfiycode) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await reOpenAccountData.verifycodeReopenAccuntData(email!, verfiycode);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.toNamed("successreopenaccount");
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
    reOpenAccountData.resndverifycode(email!);
  }
}
