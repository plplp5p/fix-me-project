import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/View/screen/Contactor/home/contractorhome.dart';
import 'package:project2/View/screen/Contactor/profile/contractorprofile.dart';

class ContractorScreenController extends GetxController {
  int currentPage = 0;
  List<Widget> pagesList = [const ContractorHome(), const ContractorProfile()];

  List pageTitle = [
    "Home".tr,
    "Profile".tr,
  ];

  List<IconData> pageIcon = [
    Icons.home,
    Icons.person,
  ];

  changePage(i) {
    currentPage = i;
    update();
  }
}
