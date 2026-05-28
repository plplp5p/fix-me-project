import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/home/workerhome_controller.dart';
import 'package:project2/View/widget/User/homeimagecontainer.dart';
import 'package:project2/View/widget/Worker/home/requestcontainer.dart';

class WorkerHome extends StatelessWidget {
  const WorkerHome({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(WorkerhomeController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Text(
            "Fixme".tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const HomeImageContainer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text(
              'My Requst :',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          
            GetBuilder<WorkerhomeController>(builder: (controller) {
              return Requsethomecontainer();
            }),
        ]),
      ),
    );
  }
}
