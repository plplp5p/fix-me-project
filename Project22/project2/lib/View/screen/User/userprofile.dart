import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/userprofile_controller.dart';
import 'package:project2/View/widget/User/userprofile/customrowtextandicon.dart';
import 'package:project2/View/widget/User/userprofile/profilecontainers.dart';
import 'package:project2/View/widget/User/userprofile/userimage.dart';
import 'package:project2/View/widget/User/userprofile/usernameandfirstname.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileController controller = Get.put(UserProfileController());
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
              const Usernameandfirstname(),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
             CustomRowTextAndIcon(
                text: "Languege".tr,
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
              CustomRowTextAndIcon(
                text: "Address".tr,
                icon: Icons.location_on_outlined,
              ),
              ProfileContainers(
                text: "My Address".tr,
                onTap: () {
                  controller.goToaddress();
                },
              ),
              CustomRowTextAndIcon(
                text: "Orders".tr,
                icon: FontAwesomeIcons.clipboardList,
              ),
              ProfileContainers(
                text: "My Orders".tr,
                onTap: () {
                  controller.goToMyOrdersPage();
                },
              ),
              CustomRowTextAndIcon(
                text: "Completed Orders".tr,
                icon: FontAwesomeIcons.checkSquare,
              ),
              ProfileContainers(
                text: "My Completed Orders".tr,
                onTap: () {
                  controller.goToMyCompletedOrdersPage();
                },
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
