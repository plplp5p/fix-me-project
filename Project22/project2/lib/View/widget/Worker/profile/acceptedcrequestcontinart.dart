import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/profile/workeracceptedrequest_controller.dart';

class Acceptrequsetcontainer extends StatelessWidget {
  const Acceptrequsetcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    ViewacceptrequsetController controller =
        Get.put(ViewacceptrequsetController());

    return ListView.builder(
        itemCount: controller.requestmodel.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.goToTrakingPage(controller.requestmodel[i]);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Appcolors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: Column(children: [
                OrderDetails(
                  icon: Icons.person,
                  text: "Worker : ${controller.requestmodel[i].workerUsername}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: FontAwesomeIcons.moneyBillAlt,
                  text: "Cost : ${controller.requestmodel[i].cost}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: FontAwesomeIcons.tools,
                  text: "Service : ${controller.requestmodel[i].service}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: FontAwesomeIcons.person,
                  text:
                      "Customer : ${controller.requestmodel[i].customerUsername}",
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time : ${Jiffy.parse('${controller.requestmodel[i].requestTimeDate}').fromNow()}",
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Appcolors.primaryColor,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          controller.Donereq(
                              controller.requestmodel[i].requestId!);
                        },
                        child: const Text(
                          'Finished',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }
}

class OrderDetails extends StatelessWidget {
  final String text;
  final IconData? icon;
  const OrderDetails({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
