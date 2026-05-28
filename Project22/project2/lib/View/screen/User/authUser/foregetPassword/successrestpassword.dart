import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/authControllrt/forgetPassword/successrestpass_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class SuccessRestPassword extends StatelessWidget {
  const SuccessRestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    UserSuccessrestpassController controller = Get.put(UserSuccessrestpassController());
    return Scaffold(
      body: CustomBackgroundColorsign(
          child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 80),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const CustomLargeText(
                  text: "Successfull Rest Password",
                ),
                const SizedBox(
                  height: 60,
                ),
                const Icon(Icons.check_circle_outline,
                    size: 120, color: Appcolors.darkgreen),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Password has been set successfully",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Appcolors.black),
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomButton(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goTologin();
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
