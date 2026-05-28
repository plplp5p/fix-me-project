import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Contractor/home/notification_controller.dart';
import 'package:project2/View/widget/Contractor/notificationcontainrt.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContractorNotificationController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const Center(
              child: CustomLargeText(
                text: "Notifications",
              ),
            ),
            GetBuilder<ContractorNotificationController>(
                builder: (controller) => NotificationContainrt()),
          ],
        ),
      ),
    );
  }
}
