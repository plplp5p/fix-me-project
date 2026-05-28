import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Worker/authController/forgetpassword/workerrestpassword_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/auth/customtextformfiledsign.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class WorkerRestPassword extends StatelessWidget {
  const WorkerRestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerrestpasswordController controller =
        Get.put(WorkerrestpasswordController());
    return Scaffold(
        body: CustomBackgroundColorsign(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                CustomLargeText(
                  text: "Rest Password".tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomSmallText(
                  text: "Enter Your Password To Proceed".tr,
                ),
                const SizedBox(
                  height: 40,
                ),
                 GetBuilder<WorkerrestpasswordController>(builder: (controller) {
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
                
                 GetBuilder<WorkerrestpasswordController>(builder: (controller) {
                  return Form(
                    key: controller.key2,
                    child: CustomtTextFormFieldSign(
                      obscure: controller.obscureText2,
                      controller: controller.repassword,
                      hintText: "Confirm Your Password",
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
                  text: "Save".tr,
                  onPressed: () {
                    controller.goToRestPasswordWorker();
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
