import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Worker/profile/workerprofile_controller.dart';

class WorkerNameAndUsername extends GetView<WorkerProfileController> {
  const WorkerNameAndUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (controller.firstname != null)
          Text(
            "${controller.firstname}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(
          height: 10,
        ),
         if (controller.username != null)
        Text(
         
          "${controller.username}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
