import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Admin/acceptcontractor_data.dart';
import 'package:project2/Model/data/Admin/deletecontractor_data.dart';
import 'package:project2/Model/model/Contractor/contractormodel.dart';

class ContractorDetailsInfoController extends GetxController {
  late ContractorModel contractorModel;
  late String inquiryStatus;
  ContractorAccept contractorAccept = ContractorAccept(Get.find());

  ContractorDelete deleteContractor = ContractorDelete(Get.find());

  initialContractorData() {
    contractorModel = Get.arguments['contractorModel'];
  }

  @override
  void onInit() {
    initialContractorData();
    super.onInit();
  }

  acceptContrctorWithInSystem() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await contractorAccept
        .acceptContractor(contractorModel.contactorEmial!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.defaultDialog(
            title: "Alert",
            middleText:
                "The Contractor will be accepted within the application",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "Confirm",
            buttonColor: Appcolors.primaryColor);
      } else {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The Contractor has already been accepted",
            middleTextStyle: const TextStyle(fontSize: 17),
            contentPadding: EdgeInsetsGeometry.lerp(
                const EdgeInsets.all(20), const EdgeInsets.all(20), 4));
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  deleteContractorFormSystem() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await deleteContractor
        .deleteContractor(contractorModel.contactorEmial!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.defaultDialog(
            title: "Alert",
            middleText: "The Contractor will be deleted from the application",
            onConfirm: () {
              Get.offNamed("adminfirstpage");
            },
            textConfirm: "Confirm",
            buttonColor: Appcolors.primaryColor);
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
