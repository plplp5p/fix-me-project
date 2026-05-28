import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/search_controller.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class WorkerListSearch extends GetView<UserSearchController> {
  final List<WorkerModel> workers;
  const WorkerListSearch({super.key, required this.workers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: workers.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.goToWorkerDetails(workers[i]);
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
                  "${workers[i].firstName}",
                  style: const TextStyle(fontSize: 22),
                ),
                trailing: Text(
                  "${workers[i].userName}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        });
  }
}