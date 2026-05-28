import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/User/request/request_controller.dart';
import 'package:project2/View/widget/shared/sharedtextformfield.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    RequestController controller = Get.put(RequestController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: CustomLargeText(
                    text: "Request".tr,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Form(
                  key: controller.mykey1,
                  child: SharedTextFormField(
                    text: Text("Worker UserName".tr),
                    icon: FontAwesomeIcons.userCircle,
                    onChanged: controller.onChangeUsername,
                    mycontroller: controller.workerUsername,
                    validator: (value) {
                      return validInput(value!, "username", 20, 8);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SharedTextFormField(
                  text: Text("Cost".tr),
                  icon: FontAwesomeIcons.wallet,
                  mycontroller: controller.cost,
                  isNumber: controller.isNumber,
                ),
                const SizedBox(
                  height: 10,
                ),
                SharedTextFormField(
                  text: Text("Service".tr),
                  icon: FontAwesomeIcons.tools,
                  mycontroller: controller.service,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Order".tr,
                  onPressed: () {
                    controller.goTocheckout();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
