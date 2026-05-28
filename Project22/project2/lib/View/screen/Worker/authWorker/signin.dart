import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/column_language.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Worker/authController/signin_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/auth/customcontainercircular.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsingorlogin.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class WorkerSignIn extends StatelessWidget {
  const WorkerSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerSignUpController controller = Get.put(WorkerSignUpController());

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
                  onTap: () {},
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
                  controller: controller.lice,
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
                key: controller.mykey2,
                child: CustomtTextFormFieldSign(
                  controller: controller.username,
                  hintText: "Enter Your Username".tr,
                  icon: Icons.person_outline,
                  validator: (val) {
                    return validInput(val!, "username", 20, 8);
                  },
                  onChanged: controller.onChangeUsername,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: controller.mykey3,
                child: CustomtTextFormFieldSign(
                  controller: controller.firstname,
                  hintText: "Enter Your Frist Name".tr,
                  icon: Icons.person_pin,
                  validator: (val) {
                    return validateInput(val!);
                  },
                  onChanged: controller.onChangeFirstname,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: controller.mykey4,
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
              GetBuilder<WorkerSignUpController>(builder: (controller) {
                return Form(
                  key: controller.mykey5,
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
                    onChanged: controller.onChangePass,
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: controller.mykey6,
                child: CustomtTextFormFieldSign(
                    controller: controller.cont_ema,
                    hintText: "Enter Your Contractor Email".tr,
                    icon: Icons.lock_outline,
                    validator: (val) {
                      return validInput(val!, "email", 30, 12);
                    },
                    onChanged: controller.onChangeContractorEmail),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Choose Your Profession",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GetBuilder<WorkerSignUpController>(builder: (controller) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.wokerCategories.length,
                    itemBuilder: (context, i) {
                      return RadioListTile(
                          title: Text(culomnLanguge(
                              controller.wokerCategories[i]['categories_name'],
                              controller.wokerCategories[i]
                                  ['categories_name_ar'])),
                          value: controller.workerValues[i],
                          groupValue: controller.cat,
                          onChanged: controller.chagecat);
                    });
              }),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Sign Up".tr,
                onPressed: () {
                  controller.bringData();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomSingorLogin(
                text1: "Already have an account ? ".tr,
                text2: "Login".tr,
                onTap: () {
                  controller.goTologin();
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
