import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Worker/workerscreen_controller.dart';
import 'package:project2/View/widget/customPageButton.dart';

class WorkerScreen extends StatelessWidget {
  const WorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WokerScreenContoller());
    return GetBuilder<WokerScreenContoller>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
