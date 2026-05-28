import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/home/home_controller.dart';
import 'package:project2/View/widget/User/homecategorieslist.dart';
import 'package:project2/View/widget/User/homeimagecontainer.dart';
import 'package:project2/View/widget/User/homesearchandname.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              HomeSearchandName(
                onPressed: controller.goToSearchPage,
              ),
              const SizedBox(
                height: 20,
              ),
              const HomeImageContainer(),
              const SizedBox(
                height: 15,
              ),
              CustomLargeText(text: "Categories".tr),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<HomeController>(builder: (controller) {
                return HomeCategoriesList();
              }),
            ],
          )),
    );
  }
}
