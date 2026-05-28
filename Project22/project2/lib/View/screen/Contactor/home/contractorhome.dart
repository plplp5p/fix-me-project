import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/home/contractorhome_controller.dart';
import 'package:project2/View/widget/Contractor/homecontainer.dart';
import 'package:project2/View/widget/User/homesearchandname.dart';

class ContractorHome extends StatelessWidget {
  const ContractorHome({super.key});

  @override
  Widget build(BuildContext context) {
    ContractorHomeController controller = Get.put(ContractorHomeController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            HomeSearchandName(
              onPressed: () {
                controller.goToSearcPage();
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Workers",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      controller.goToNotificationPage();
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 35,
                    ))
              ],
            ),
            const SizedBox(height: 10),
            GetBuilder<ContractorHomeController>(
                builder: (controller) => HomeContainer()),
          ],
        ),
      ),
    );
  }
}
