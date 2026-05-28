import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/constant/appimages.dart';
import 'package:project2/Controllers/Admin/workerInfopage_controller.dart';
import 'package:project2/View/widget/admin/customlistworkers.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WorkerInfoPageController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView(children: [
          Column(
            children: [
              const CustomLargeText(
                text: "Home",
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(Appimages.adminImage)),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Workers : ",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<WorkerInfoPageController>(builder: (controller) {
                return CustomListWorkers();
              })
            ],
          ),
        ]),
      ),
    );
  }
}
