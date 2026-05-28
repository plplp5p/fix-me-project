import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/Contractor/profile/contractorprofile_controller.dart';


class ContractorNameAndUsername extends GetView<ContractorProfileController> {
  const ContractorNameAndUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
