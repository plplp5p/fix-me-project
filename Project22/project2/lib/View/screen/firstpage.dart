import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/firstpage_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/View/widget/auth/customsmalltext.dart';
import 'package:project2/View/widget/custombackgroundcolorsign.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirstPageController controller = Get.put(FirstPageController());
    return CustomBackgroundColorsign(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 450,
                ),
                CustomLargeText(
                  text: "Join To Us".tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomSmallText(
                  text: "Welcome".tr,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "Start".tr,
                  onPressed: () {
                    controller.goToUserSignIn();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
