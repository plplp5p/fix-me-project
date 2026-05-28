import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/contractorscreen_controller.dart';
import 'package:project2/View/widget/customPageButton.dart';

class ContractorScreen extends StatelessWidget {
  const ContractorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContractorScreenController());
    return GetBuilder<ContractorScreenController>(
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.black,
          height: 75,
          color: Appcolors.white,
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                controller.pagesList.length,
                (index) => CustomtPageButton(
                  pagetext: controller.pageTitle[index],
                  iconData: controller.pageIcon[index],
                  active: controller.currentPage == index ? true : false,
                  onPressed: () {
                    controller.changePage(index);
                  },
                ),
              )
            ],
          ),
        ),
        body: controller.pagesList.elementAt(controller.currentPage),
      ),
    );
  }
}
