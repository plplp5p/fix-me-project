import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Worker/authController/forgetpassword/forgetpassword_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/auth/customcontainercircular.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class WorkerForegetPassword extends StatelessWidget {
  const WorkerForegetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerForgetpasswordController controller =
        Get.put(WorkerForgetpasswordController());
    return Scaffold(
        body: CustomBackgroundColorsign(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 10),
                child: const CustomContainerCircular(),
              ),
              CustomLargeText(
                text: "Foreget Password".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSmallText(
                text: "Enter Your Email To Proceed".tr,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: controller.mykey,
                child: CustomtTextFormFieldSign(
                  controller: controller.email,
                  hintText: "Enter Your Email".tr,
                  icon: Icons.email_outlined,
                  onPressed: () {},
                  validator: (val) {
                    return validInput(val!, "email", 30, 12);
                  },
                  onChanged: controller.onChangeEmail,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "Check".tr,
                onPressed: () {
                  controller.goToVerifyCodePass();
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
