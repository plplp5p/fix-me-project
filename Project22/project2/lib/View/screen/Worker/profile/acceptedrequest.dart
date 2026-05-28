import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Worker/profile/workeracceptedrequest_controller.dart';
import 'package:project2/View/widget/Worker/profile/acceptedcrequestcontinart.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class Acceptrequest extends StatelessWidget {
  const Acceptrequest({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewacceptrequsetController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20),
        child: ListView(children: [
          const Center(
            child: CustomLargeText(
              text: "Accepted Requests",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GetBuilder<ViewacceptrequsetController>(builder: (controller) {
            return Acceptrequsetcontainer();
          })
        ]),
      ),
    );
  }
}
