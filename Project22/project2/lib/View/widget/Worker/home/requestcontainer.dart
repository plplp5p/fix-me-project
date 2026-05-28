import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/home/workerhome_controller.dart';

class Requsethomecontainer extends StatelessWidget {
  const Requsethomecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerhomeController controller = Get.put(WorkerhomeController());
    return ListView.builder(
        itemCount: controller.requestmodel.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.goToRequsetdetalisinfo(controller.requestmodel[i]);
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
              child: Column(
                children: [
                  OrderDetails(
                    icon: Icons.person,
                    text:
                        "Worker : ${controller.requestmodel[i].workerUsername}",
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
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
