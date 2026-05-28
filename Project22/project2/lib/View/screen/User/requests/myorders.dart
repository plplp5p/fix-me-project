import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/request/myorders_controller.dart';
import 'package:project2/View/widget/User/request/ordercontainer.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserMyordersController());
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
                    text: "My Orders".tr,
                  ),
                ),
                const SizedBox(height: 30),
                GetBuilder<UserMyordersController>(builder: (controller) {
                  return Ordercontainer();
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
