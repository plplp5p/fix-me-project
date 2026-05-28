import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/home/notification_controller.dart';

class NotificationContainrt extends StatelessWidget {
  const NotificationContainrt({super.key});

  @override
  Widget build(BuildContext context) {
    ContractorNotificationController controller =
        Get.put(ContractorNotificationController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...List.generate(
            controller.notifications.length,
            (i) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Stack(
                    children: [
                      ListTile(
                          title: Text(
                            "${controller.notifications[i].title}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(
                            "${controller.notifications[i].content}",
                            style: const TextStyle(fontSize: 16),
                          )),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Text(
                            Jiffy.parse(
                                    '${controller.notifications[i].timeDate}')
                                .fromNow(),
                            style: const TextStyle(
                                color: Appcolors.primaryColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ))
      ],
    );
  }
}
