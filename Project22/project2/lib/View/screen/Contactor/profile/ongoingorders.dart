import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Contractor/profile/ongoingordes_controller.dart';
import 'package:project2/View/widget/Contractor/acceptedorderscontainer.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class OnGoinOrders extends StatelessWidget {
  const OnGoinOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnGoingOrdesController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CustomLargeText(
                    text: "Accepted Ongoing Orders",
                  ),
                ),
                const SizedBox(height: 30),
                GetBuilder<OnGoingOrdesController>(builder: (controller) {
                  return AcceptedOrdersContainer();
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
