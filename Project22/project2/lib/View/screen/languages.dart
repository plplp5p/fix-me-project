import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/localization/changelanguage.dart';
import 'package:project2/View/widget/shared/custombutton.dart';

class Languages extends StatelessWidget {
   const Languages({super.key});
  @override
  Widget build(BuildContext context) {
    Changelanguage c = Get.find();
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1".tr,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "Ar",
            onPressed: () {
              c.changeLang("ar");
              Get.offAllNamed("firstpage");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "En",
            onPressed: () {
              c.changeLang("en");
              Get.offAllNamed("firstpage");
            },
          ),
        ],
      ),
    ));
  }
  
 
}
