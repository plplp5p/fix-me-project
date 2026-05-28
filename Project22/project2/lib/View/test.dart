import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/column_language.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/test_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/auth/customcontainercircular.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsingorlogin.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    TestController controller = Get.put(TestController());

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
              CustomtTextFormFieldSign(
                controller: controller.lice,
                hintText: "Enter Your License".tr,
                icon: Icons.assignment_ind_outlined,
                onPressed: () {},
                validator: (val) {
                  return validInput(val!, "License", 10, 10);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtTextFormFieldSign(
                controller: controller.username,
                hintText: "Enter Your Username".tr,
                icon: Icons.person_outline,
                onPressed: () {},
                validator: (val) {
                  return validInput(val!, "username", 20, 8);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtTextFormFieldSign(
                controller: controller.firstname,
                hintText: "Enter Your Frist Name".tr,
                icon: Icons.person_pin,
                onPressed: () {},
                validator: (val) {
                  return validateInput(val!);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtTextFormFieldSign(
                controller: controller.email,
                hintText: "Enter Your Email".tr,
                icon: Icons.email_outlined,
                onPressed: () {},
                validator: (val) {
                  return validInput(val!, "email", 30, 12);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtTextFormFieldSign(
                controller: controller.password,
                hintText: "Enter Your Password".tr,
                icon: Icons.lock_outline,
                onPressed: () {},
                validator: (val) {
                  return validInput(val!, "password", 20, 8);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtTextFormFieldSign(
                controller: controller.cont_ema,
                hintText: "Enter Your Contractor Email".tr,
                icon: Icons.lock_outline,
                onPressed: () {},
                validator: (val) {
                  return validInput(val!, "email", 30, 12);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Choose Your Profession",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GetBuilder<TestController>(builder: (controller) {
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
                onTap: () {},
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
