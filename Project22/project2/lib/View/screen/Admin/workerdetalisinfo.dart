import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Admin/workerdetailsinfo_controller.dart';
import 'package:project2/View/widget/admin/custumworkercontainer.dart';
import 'package:project2/View/widget/admin/textdetialsinfo.dart';
import 'package:project2/View/widget/shared/custombutton.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class WorkerDetailsInfo extends StatelessWidget {
  const WorkerDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerDetailsInfoController controller =
        Get.put(WorkerDetailsInfoController());
    return Scaffold(
        backgroundColor: Appcolors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                const Center(
                  child: CustomLargeText(
                    text: "Worker Information",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextDetialsInfo(
                  text: "First name",
                ),
                CustomWorkerAndContractorcontainer(
                  text: '${controller.workerModel.firstName}',
                ),
                const TextDetialsInfo(
                  text: "Username",
                ),
                CustomWorkerAndContractorcontainer(
                  text: '${controller.workerModel.userName}',
                ),
                const TextDetialsInfo(
                  text: "Email",
                ),
                CustomWorkerAndContractorcontainer(
                  text: '${controller.workerModel.workerEmail}',
                ),
                const TextDetialsInfo(
                  text: "Worker Categorie",
                ),
                CustomWorkerAndContractorcontainer(
                    text: '${controller.workerModel.workerCategories}'),
                const TextDetialsInfo(
                  text: "License Number",
                ),
                CustomWorkerAndContractorcontainer(
                    text: '${controller.workerModel.license}'),
                const TextDetialsInfo(
                  text: "Contractor Email",
                ),
                CustomWorkerAndContractorcontainer(
                    text: '${controller.workerModel.contactorEmail}'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(
                    text: 'Accept',
                    onPressed: () {
                      controller.acceptWorkerWithinSystem();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(
                    text: 'Delete',
                    onPressed: () {
                      controller.deletWorker();
                    },
                  ),
                ),
                const SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ));
  }
}
