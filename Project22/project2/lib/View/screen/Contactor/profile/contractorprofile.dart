import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/profile/contractorprofile_controller.dart';
import 'package:project2/View/widget/Contractor/contractornameandusername.dart';
import 'package:project2/View/widget/User/userprofile/customrowtextandicon.dart';
import 'package:project2/View/widget/User/userprofile/profilecontainers.dart';
import 'package:project2/View/widget/User/userprofile/userimage.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContractorProfile extends StatelessWidget {
  const ContractorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ContractorProfileController controller =
        Get.put(ContractorProfileController());
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              Center(
                child: CustomLargeText(
                  text: "My Profile".tr,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const UserImage(),
              const ContractorNameAndUsername(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                height: 40,
                child: MaterialButton(
                  onPressed: () {
                    controller.goToEditProfilePage();
                  },
                  color: Appcolors.primaryColor,
                  child: const Text(
                    "Edit profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              const CustomRowTextAndIcon(
                text: "Language",
                icon: Icons.language,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileContainers(
                text: "Arabic".tr,
                onTap: () {
                  controller.chageArabic();
                },
              ),
              ProfileContainers(
                text: "English".tr,
                onTap: () {
                  controller.changeEnglish();
                },
              ),
              const CustomRowTextAndIcon(
                  text: "Ongoing Orders", icon: FontAwesomeIcons.checkSquare),
              ProfileContainers(
                text: "Accepted Ongoing Orders".tr,
                onTap: () {
                  controller.goToOngoingOrders();
                },
              ),
              const CustomRowTextAndIcon(
                text: "LogOut",
                icon: Icons.logout,
              ),
              ProfileContainers(
                text: "Logout".tr,
                onTap: () {
                  controller.logout();
                },
              ),
            ])));
  }
}
