import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/request/compeletedorders_controller.dart';
import 'package:project2/View/widget/User/request/compeletedorderscontainer.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class MyCompletedOrdersPage extends StatelessWidget {
  const MyCompletedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserCompeletedOrdersController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomLargeText(
                    text: "My Completed Orders".tr,
                  ),
                ),
                const SizedBox(height: 30),
                GetBuilder<UserCompeletedOrdersController>(builder: (controller) {
                  return CompeletedOrdersContainer();
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
