import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/User/address/addressdetails_controller.dart';
import 'package:project2/View/widget/shared/sharedtextformfield.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsController controller = Get.put(AddressDetailsController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Center(
              child: CustomLargeText(
                text: "Address Details".tr,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: controller.mykey1,
              child: SharedTextFormField(
                text: Text("Name of the area".tr),
                icon: Icons.edit_location_outlined,
                mycontroller: controller.areaname!,
                validator: (val) {
                  return validateInput(val!);
                },
                onChanged: controller.onChangeAreaName,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: controller.mykey2,
              child: SharedTextFormField(
                text: Text("City name".tr),
                icon: Icons.location_city_outlined,
                mycontroller: controller.city!,
                validator: (val) {
                  return validateInput(val!);
                },
                onChanged: controller.onChangeCity,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: controller.mykey3,
              child: SharedTextFormField(
                text: Text("Street name".tr),
                icon: Icons.location_on_outlined,
                mycontroller: controller.street!,
                validator: (val) {
                  return validateInput(val!);
                },
                onChanged: controller.onChangeStreet,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                onPressed: () {
                  controller.insertAddressData();
                },
                text: "Save".tr,
              ),
            )
          ],
        ),
      ),
    );
  }
}
