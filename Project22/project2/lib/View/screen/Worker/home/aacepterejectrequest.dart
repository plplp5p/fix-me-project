import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Worker/home/workeracceptrequest_controller.dart';
import 'package:project2/View/widget/Worker/home/addresscontainer.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class Requsetdetalisinfo extends StatelessWidget {
  const Requsetdetalisinfo({super.key});

  @override
  Widget build(BuildContext context) {
    RequsedetalisinfoController controller =
        Get.put(RequsedetalisinfoController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const Center(
              child: CustomLargeText(
                text: "Address details",
              ),
            ),
            const SizedBox(height: 20),
            const AddressContainer(),
            const SizedBox(height: 50),
            CustomButton(
                text: 'Accept',
                onPressed: () {
                  controller.acceptReq();
                }),
            const SizedBox(height: 20),
            CustomButton(
                text: 'Reject',
                onPressed: () {
                  controller.rejectReq();
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
