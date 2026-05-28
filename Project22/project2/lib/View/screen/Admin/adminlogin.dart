import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Admin/adminlogin_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    AdminloginController controller = Get.put(AdminloginController());
    return Scaffold(
        body: CustomBackgroundColorsign(
      child: ListView(
        children: [
          Form(
            key: controller.mykey,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  const CustomLargeText(
                    text: "Login",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomSmallText(
                    text: "Enter Your Details To Proceed",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomtTextFormFieldSign(
                    controller: controller.email,
                    hintText: "Enter Your Email",
                    icon: Icons.assignment_ind_outlined,
                    onPressed: () {},
                    validator: (val) {
                      return validInput(val!, "email", 30, 15);
                    },
                    onChanged: controller.onChangeEmail,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<AdminloginController>(builder: (controller) {
                    return Form(
                      key: controller.mykey2,
                      child: CustomtTextFormFieldSign(
                        obscure: controller.obscure,
                        controller: controller.password,
                        hintText: "Enter Your Password",
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
                    height: 100,
                  ),
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      controller.goToAdminHome();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
