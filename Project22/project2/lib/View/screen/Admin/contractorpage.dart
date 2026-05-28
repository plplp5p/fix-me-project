import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/constant/appimages.dart';
import 'package:project2/Controllers/Admin/contractorpage_controller.dart';
import 'package:project2/View/widget/admin/customlistcontractors.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';

class ContractorPage extends StatelessWidget {
  const ContractorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContractorInfoPageController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 30),
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
                  const Text(
                    "Contractors : ",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ContractorInfoPageController>(builder: (controller) {
                return CustomListContractor();
              })
            ],
          ),
        ]),
      ),
    );
  }
}
