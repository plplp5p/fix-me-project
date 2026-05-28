import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/screen_conroller.dart';
import 'package:project2/View/widget/customPageButton.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScreenContoller());
    return GetBuilder<ScreenContoller>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.black,
          height: 75,
          color: Appcolors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                controller.pagesList.length,
                (index) => Expanded(
                  child: CustomtPageButton(
                    pagetext: controller.pageTitle[index],
                    iconData: controller.pageIcon[index],
                    active: controller.currentPage == index ? true : false,
                    onPressed: () {
                      controller.changePage(index);
                    },
                  ),
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
