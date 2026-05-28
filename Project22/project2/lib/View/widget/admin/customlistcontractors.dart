import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Admin/contractorpage_controller.dart';
import 'package:project2/Model/model/Contractor/contractormodel.dart';

class CustomListContractor extends StatelessWidget {
  const CustomListContractor({super.key});
  @override
  Widget build(BuildContext context) {
    ContractorInfoPageController controller =
        Get.put(ContractorInfoPageController());
    return ListView.builder(
        itemCount: controller.contractorData.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return ContainerPart(
            contractorModel:
                ContractorModel.fromJson(controller.contractorData[i]),
          );
        });
  }
}

class ContainerPart extends GetView<ContractorInfoPageController> {
  final ContractorModel contractorModel;
  const ContainerPart({
    super.key,
    required this.contractorModel,
  });
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${contractorModel.userName}",
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
                  controller.goToContractorDetailsInfo(contractorModel);
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
