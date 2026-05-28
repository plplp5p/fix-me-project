import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/request/usercheckout_controller.dart';
import 'package:project2/View/widget/User/request/checkout/addresscontainer.dart';
import 'package:project2/View/widget/User/request/checkout/paymentmethodcontainer.dart';
import 'package:project2/View/widget/User/request/checkout/primarytext.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    UsercheckoutController controller = Get.put(UsercheckoutController());
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            text: "CheckOut".tr,
            onPressed: () {
              controller.chekout();
            },
          ),
        ),
        body: GetBuilder<UsercheckoutController>(builder: (controller) {
          return Container(
              margin: const EdgeInsets.only(top: 30),
              child: ListView(children: [
                Center(
                  child: CustomLargeText(
                    text: "Checkout".tr,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryText(
                  text: "Choose Payment Method".tr,
                ),
                InkWell(
                  onTap: () {
                    controller.onSelectPayment("0");
                  },
                  child: PaymentMethodContainer(
                    active: controller.payment == "0" ? true : false,
                    text: "Pay by card".tr,
                    icon: FontAwesomeIcons.creditCard,
                    color: const Color.fromARGB(255, 0, 67, 134),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onSelectPayment("1");
                  },
                  child: PaymentMethodContainer(
                    active: controller.payment == "1" ? true : false,
                    text: "Pay in cash".tr,
                    icon: FontAwesomeIcons.wallet,
                    color: const Color.fromARGB(255, 27, 134, 0),
                  ),
                ),
                PrimaryText(
                  text: "Choose Your Address".tr,
                ),
                ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: controller.userAddress.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          controller.onSelectAddress(
                              controller.userAddress[i].addressId.toString());
                        },
                        child: AddressContainer(
                          active: controller.address ==
                                  controller.userAddress[i].addressId.toString()
                              ? true
                              : false,
                          text1: "${controller.userAddress[i].addressName}",
                          text2:
                              "${controller.userAddress[i].city} , ${controller.userAddress[i].street}",
                        ),
                      );
                    })
              ]));
        }));
  }
}
