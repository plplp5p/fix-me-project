import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/profile/workerprofile_controller.dart';
import 'package:project2/View/widget/User/userprofile/customrowtextandicon.dart';
import 'package:project2/View/widget/User/userprofile/profilecontainers.dart';
import 'package:project2/View/widget/User/userprofile/userimage.dart';
import 'package:project2/View/widget/Worker/profile/workernameandusername.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class WorkerProfile extends StatelessWidget {
  const WorkerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerProfileController controller = Get.put(WorkerProfileController());
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
              const WorkerNameAndUsername(),
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
                text: "Accepted Orders",
                icon: FontAwesomeIcons.checkSquare,
              ),
              ProfileContainers(
                text: "My Accepted Orders".tr,
                onTap: () {
                  controller.goToAcceptedReq();
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
