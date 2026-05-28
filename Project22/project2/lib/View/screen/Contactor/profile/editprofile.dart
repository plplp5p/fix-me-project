import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Contractor/profile/editprofile_controller.dart';
import 'package:project2/View/widget/Contractor/editprofiletextformfield.dart';
import 'package:project2/View/widget/User/userprofile/customrowtextandicon.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class ContractorEditProfile extends StatelessWidget {
  const ContractorEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditprofileController controller = Get.put(EditprofileController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const Center(
              child: CustomLargeText(
                text: "Edit My Profile",
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const CustomRowTextAndIcon(
                text: "User Information", icon: FontAwesomeIcons.user),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: controller.mykey1,
              child: EditProfileTextFormField(
                controller: controller.username,
                text: "Username",
                icon: Icons.person,
                onChanged: controller.onChangeusername,
                validator: (val) {
                  return validInput(val!, "username", 20, 8);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            EditProfileTextFormField(
              controller: controller.firstname,
              text: "First name",
              icon: Icons.person,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomRowTextAndIcon(
                text: "Address Information",
                icon: FontAwesomeIcons.mapMarkerAlt),
            const SizedBox(
              height: 30,
            ),
            EditProfileTextFormField(
              controller: controller.city,
              text: "City",
              icon: Icons.location_city,
            ),
            const SizedBox(
              height: 20,
            ),
            EditProfileTextFormField(
              controller: controller.street,
              text: "Street",
              icon: FontAwesomeIcons.road,
            ),
            const SizedBox(
              height: 20,
            ),
            EditProfileTextFormField(
              controller: controller.zip,
              text: "Zip",
              icon: FontAwesomeIcons.envelope,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                height: 50,
                color: Appcolors.primaryColor,
                onPressed: () {
                  controller.editData();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
