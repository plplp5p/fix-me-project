import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/column_language.dart';
import 'package:project2/Controllers/User/home/workercate_controller.dart';
import 'package:project2/View/widget/User/homesearchandname.dart';
import 'package:project2/View/widget/User/workerlistincategories.dart';

class WorkerCategories extends StatelessWidget {
  const WorkerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    WorkercateController controller = Get.put(WorkercateController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            HomeSearchandName(
              onPressed: () {
                controller.goToSearchPage();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "${culomnLanguge(controller.categoriesname, controller.categoriesnamear)}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<WorkercateController>(
              builder: (controller) {
                return WorkerListInCategories();
              },
            )
          ],
        ),
      ),
    );
  }
}
