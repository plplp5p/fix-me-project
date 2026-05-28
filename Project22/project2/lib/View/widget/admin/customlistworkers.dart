import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Admin/workerInfopage_controller.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class CustomListWorkers extends StatelessWidget {
  const CustomListWorkers({super.key});
  @override
  Widget build(BuildContext context) {
    WorkerInfoPageController controller = Get.put(WorkerInfoPageController());
    return ListView.builder(
        itemCount: controller.workerInfo.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return ContainerPart(
            workerModel: WorkerModel.fromJson(controller.workerInfo[i]),
          );
        });
  }
}

class ContainerPart extends StatelessWidget {
  final WorkerModel workerModel;
  const ContainerPart({super.key, required this.workerModel});
  @override
  Widget build(BuildContext context) {
    WorkerInfoPageController controller = Get.put(WorkerInfoPageController());
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1.5,
            color: Appcolors.primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${workerModel.userName}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Appcolors.black,
                    ),
                  ),
                )),
            Container(
              decoration: const BoxDecoration(
                color: Appcolors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  controller.goToWorkerDetailsPage(workerModel);
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
