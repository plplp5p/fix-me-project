import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/home/searchpage_controller.dart';
import 'package:project2/View/widget/Contractor/contractorsearchformfield.dart';
import 'package:project2/View/widget/Contractor/searchresult.dart';

class ContracrorSearchPage extends StatelessWidget {
  const ContracrorSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContractorSearchController());
    return Scaffold(
        backgroundColor: Appcolors.white,
        body: GetBuilder<ContractorSearchController>(
          builder: (controller) {
            return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 40),
                child: Form(
                    key: controller.mykey1,
                    child: Column(children: [
                      const ContractorSearchTextFormField(),
                      controller.userfound == false
                          ? Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                "User Not Found",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : WorkerSearchContainer(
                              workers: controller.workersList,
                            )
                    ])));
          },
        ));
  }
}
