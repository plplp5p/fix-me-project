import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/home/workercate_controller.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class WorkerListInCategories extends StatelessWidget {
  const WorkerListInCategories({super.key});

  @override
  Widget build(BuildContext context) {
    WorkercateController controller = Get.put(WorkercateController());
    return ListView.builder(
        itemCount: controller.worker.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return WorkerlistincategoriesPar2(
            workerModel: WorkerModel.fromJson(controller.worker[i]),
          );
        });
  }
}

class WorkerlistincategoriesPar2 extends GetView<WorkercateController> {
  final WorkerModel workerModel;
  const WorkerlistincategoriesPar2({super.key, required this.workerModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToWorkerDetails(workerModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black)),
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            "${workerModel.firstName}",
            style: const TextStyle(fontSize: 22),
          ),
          trailing: Text(
            "${workerModel.userName}",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
