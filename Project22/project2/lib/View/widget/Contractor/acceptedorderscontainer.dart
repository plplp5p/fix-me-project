import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/profile/ongoingordes_controller.dart';

class AcceptedOrdersContainer extends StatelessWidget {
  const AcceptedOrdersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    OnGoingOrdesController controller = Get.put(OnGoingOrdesController());
    return ListView.builder(
        itemCount: controller.userOrders.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Appcolors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                OrderDetails(
                  icon: Icons.person,
                  text: "Worker : ${controller.userOrders[i].workerUsername}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: Icons.person,
                  text:
                      "Customer : ${controller.userOrders[i].customerUsername}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: FontAwesomeIcons.moneyBillAlt,
                  text: "Cost : ${controller.userOrders[i].cost}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: FontAwesomeIcons.tools,
                  text: "Service : ${controller.userOrders[i].service}",
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderDetails(
                  icon: FontAwesomeIcons.p,
                  text:
                      "Payment method : ${controller.paymentMethode(controller.userOrders[i].paymentMethod!)}",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
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
