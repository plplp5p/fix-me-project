import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/User/authControllrt/signin_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/auth/customcontainercircular.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsingorlogin.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class UserSignIn extends StatelessWidget {
  const UserSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController controller = Get.put(SigninController());
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
                text: "Enter Your Details".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSmallText(
                text: "Tell Us More About Yourself".tr,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: controller.mykey1,
                child: CustomtTextFormFieldSign(
                  controller: controller.username,
                  hintText: "Enter Your Username".tr,
                  icon: Icons.assignment_ind_outlined,
                  validator: (value) {
                    return validInput(value!, "username", 20, 8);
                  },
                  onChanged: controller.onChangeusername,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: controller.mykey2,
                child: CustomtTextFormFieldSign(
                  controller: controller.firstname,
                  hintText: "Enter Your Frist Name".tr,
                  icon: Icons.person_pin,
                  validator: (value) {
                    return validateInput(value!);
                  },
                  onChanged: controller.onChangeuFirstname,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: controller.mykey3,
                child: CustomtTextFormFieldSign(
                  controller: controller.email,
                  hintText: "Enter Your Email".tr,
                  icon: Icons.email_outlined,
                  validator: (value) {
                    return validInput(value!, "email", 30, 12);
                  },
                  onChanged: controller.onChangeEmail,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<SigninController>(builder: (controller) {
                return Form(
                  key: controller.mykey4,
                  child: CustomtTextFormFieldSign(
                    obscure: controller.obscure,
                    controller: controller.password,
                    hintText: "Enter Your Password".tr,
                    icon: Icons.lock_outline,
                    onPressed: () {
                      controller.showpassword();
                    },
                    validator: (value) {
                      return validInput(value!, "password", 20, 8);
                    },
                    onChanged: controller.onChangeuserpass,
                  ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Sign Up".tr,
                onPressed: () {
                  controller.goToVerifyCode();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomSingorLogin(
                text1: "Already have an account ? ".tr,
                text2: "Login".tr,
                onTap: () {
                  controller.goToLogIn();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "OR".tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomSingorLogin(
                text1: "Do you want to register as ".tr,
                text2: "Service Provider".tr,
                onTap: () {
                  controller.goToContractoSignin();
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
