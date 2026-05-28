import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/request/myorders_controller.dart';

class Ordercontainer extends StatelessWidget {
  const Ordercontainer({super.key});

  @override
  Widget build(BuildContext context) {
    UserMyordersController controller = Get.put(UserMyordersController());
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
                GetBuilder<UserMyordersController>(builder: (controller) {
                  return OrderDetails(
                    icon: controller.userOrders[i].status! == '0'
                        ? FontAwesomeIcons.clock
                        : controller.userOrders[i].status! == '2'
                            ? FontAwesomeIcons.check
                            : FontAwesomeIcons.timesCircle,
                    text:
                        "Order status: ${controller.orderStatus(controller.userOrders[i].status!)}",
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                if (controller.userOrders[i].status == "0")
                  MaterialButton(
                    color: Appcolors.primaryColor,
                    onPressed: () {
                      controller
                          .cancelOrder(controller.userOrders[i].requestId!);
                    },
                    child:Text(
                      "Cancel Order".tr,
                      style:
                          const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
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
