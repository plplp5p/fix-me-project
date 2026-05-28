import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Contractor/authController/signin_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/auth/customcontainercircular.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsingorlogin.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class ContractorSignIn extends StatelessWidget {
  const ContractorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    ContactorSigninController controller = Get.put(ContactorSigninController());
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
              const CustomLargeText(
                text: "Enter Your Details",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomSmallText(
                text: "Tell Us More About Yourself",
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: controller.mykey5,
                child: CustomtTextFormFieldSign(
                  controller: controller.licenNum,
                  hintText: "Enter Your License".tr,
                  icon: Icons.assignment_ind_outlined,
                  validator: (val) {
                    return validInput(val!, "License", 10, 10);
                  },
                  onChanged: controller.onChangelicen,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Form(
                key: controller.mykey1,
                child: CustomtTextFormFieldSign(
                  controller: controller.username,
                  hintText: "Enter Your Username".tr,
                  icon: Icons.person_outline,
                  validator: (val) {
                    return validInput(val!, "username", 20, 8);
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
                  validator: (val) {
                    return validateInput(val!);
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
                  validator: (val) {
                    return validInput(val!, "email", 30, 12);
                  },
                  onChanged: controller.onChangeEmail,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ContactorSigninController>(builder: (controller) {
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
                    validator: (val) {
                      return validInput(val!, "password", 20, 8);
                    },
                    onChanged: controller.onChangeuserpass,
                  ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  controller.goToVerifyCode();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomSingorLogin(
                text1: "Already have an account ? ",
                text2: "Login",
                onTap: () {
                  controller.goToLogin();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomSingorLogin(
                text1: "Do you want to register as ",
                text2: "Worker",
                onTap: () {
                  controller.goToWorkerSignIn();
                },
              )
            ],
          )
        ],
      )),
    );
  }
}
