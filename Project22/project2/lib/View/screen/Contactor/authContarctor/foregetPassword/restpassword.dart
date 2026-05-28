import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Contractor/authController/forgetPassword/contractorrestpass_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class ContactorRestPassword extends StatelessWidget {
  const ContactorRestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ContrctorrestpassController controller =
        Get.put(ContrctorrestpassController());

    return Scaffold(
        body: CustomBackgroundColorsign(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                const CustomLargeText(
                  text: "Rest Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomSmallText(
                  text: "Enter Your Password To Proceed",
                ),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder<ContrctorrestpassController>(builder: (controller) {
                  return Form(
                    key: controller.key1,
                    child: CustomtTextFormFieldSign(
                      obscure: controller.obscureText,
                      controller: controller.newpassword,
                      hintText: "Enter Your Password",
                      icon: Icons.lock_outline,
                      onPressed: () {
                        controller.showpassword();
                      },
                      validator: (val) {
                        return validInput(val!, "password", 20, 8);
                      },
                      onChanged: controller.onChangeNewPass,
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ContrctorrestpassController>(builder: (controller) {
                  return Form(
                    key: controller.key2,
                    child: CustomtTextFormFieldSign(
                      obscure: controller.obscureText2,
                      controller: controller.repassword,
                      hintText: "Enter Your Password",
                      icon: Icons.lock_outline,
                      onPressed: () {
                        controller.showpassword();
                      },
                      validator: (val) {
                        return validInput(val!, "password", 20, 8);
                      },
                      onChanged: controller.onChangeRepatedPass,
                    ),
                  );
                }),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: "Save",
                  onPressed: () {
                    controller.goToSuuccessRestPass();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
