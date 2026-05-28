import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class SuccessReOpenAccount extends StatelessWidget {
  const SuccessReOpenAccount({super.key});

  @override
  Widget build(BuildContext context) {
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
                  text: "Successfull",
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
                  "Your account has been successfully unblocked",
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
                    Get.offAllNamed("userlogin");
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
