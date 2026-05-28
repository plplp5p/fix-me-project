import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/address/addresspage_controller.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.primaryColor,
        onPressed: () {
          Get.toNamed("addaddress");
        },
        child: const Icon(
          Icons.add,
          size: 20,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Center(
              child: CustomLargeText(
                text: "My Address".tr,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<AddressPageController>(
                builder: (controller) => ListView.builder(
                      itemCount: controller.userAddress.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 80,
                          color: Appcolors.white,
                          child: ListTile(
                            title: Text(
                              "${controller.userAddress[i].addressName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                controller.deleteAddress(
                                    controller.userAddress[i].addressId!);
                              },
                              child:  Text(
                                "Delete".tr,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Text(
                                "${controller.userAddress[i].street} , ${controller.userAddress[i].city} "),
                          ),
                        );
                      },
                    ))
          ],
        ),
      ),
    );
  }
}
