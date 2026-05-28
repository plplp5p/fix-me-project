import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/User/authControllrt/login_controller.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/View/widget/auth/customsingorlogin.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/auth/customcontainercircular.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/auth/foregetpasswordtext.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
        body: CustomBackgroundColorsign(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainerCircular(
                  onTap: () {
                    controller.gtToFirstPage();
                  },
                ),
              ),
              CustomLargeText(
                text: "Login".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSmallText(
                text: "Enter Your Details To Proceed".tr,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: controller.mykey1,
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
                height: 10,
              ),
              GetBuilder<LoginController>(builder: (controller) {
                return Form(
                  key: controller.mykey2,
                  child: CustomtTextFormFieldSign(
                    obscure: controller.obscure,
                    controller: controller.password,
                    hintText: "Enter Your Password".tr,
                    icon: Icons.lock_outline,
                    onPressed: () {
                      controller.showpassword();
                    },
                    validator: (val) {
                      return validInput(val!, "password", 20, 8);
                    },
                    onChanged: controller.onChangepassword,
                  ),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              ForegetpasswordText(
                text: 'Forgot password ?'.tr,
                onTap: () {
                  controller.goToForegetPassword();
                },
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                text: "Login".tr,
                onPressed: () {
                  controller.goToHome();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "OR".tr,
                style: const TextStyle(
                    color: Appcolors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "Sign Up".tr,
                onPressed: () {
                  controller.goToSignIn();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSingorLogin(
                text1: "Login as ".tr,
                text2: "Admin".tr,
                onTap: () {
                  controller.goToAdminlogin();
                },
              )
            ],
          ),
        ],
      ),
    ));
  }
}
