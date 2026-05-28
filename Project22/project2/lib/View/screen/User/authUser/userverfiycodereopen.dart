import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/authControllrt/userverifycodereopen_controller.dart';
import 'package:project2/View/widget/User/textresendverify.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class UserVerifyCodeReOpenAccount extends StatelessWidget {
  const UserVerifyCodeReOpenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    UserVerifycodeReOpenAccountController controller =
        Get.put(UserVerifycodeReOpenAccountController());
    return Scaffold(
      body: CustomBackgroundColorsign(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  const CustomLargeText(
                    text: "Unlock The Account",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Enter The Code To Unlock Your Account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: Appcolors.white,
                    fieldWidth: 60,
                    focusedBorderColor: Appcolors.primaryColor,
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      controller.reOpenAccunt(verificationCode);
                    }, 
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextResendVerify(
                    onPressed: () {
                      controller.resendverify();
                    },
                    text: "Resend verify code",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
