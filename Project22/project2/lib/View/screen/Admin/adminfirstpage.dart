import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Admin/adminfirstpage_controller.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class AdminFirstPage extends StatelessWidget {
  const AdminFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdminfirstpageController controller = Get.put(AdminfirstpageController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Appcolors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const CustomLargeText(
              text: "Home",
            ),
            const SizedBox(
              height: 280,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  text: "Contractor",
                  onPressed: () {
                    controller.goToContractorPage();
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                text: "Worker",
                onPressed: () {
                  controller.goToWorkerPage();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
