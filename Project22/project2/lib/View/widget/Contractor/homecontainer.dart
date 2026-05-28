import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/home/contractorhome_controller.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ContractorHomeController controller = Get.put(ContractorHomeController());
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.workers.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              controller.goToWorkerDetails(controller.workers[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Appcolors.white,
                  border: Border.all(
                    color: Appcolors.black,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Appcolors.primaryColor,
                ),
                leading: const Icon(
                  Icons.person,
                  color: Appcolors.primaryColor,
                ),
                title: Text(
                  "${controller.workers[index].firstName}",
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ));
      },
    );
  }
}
