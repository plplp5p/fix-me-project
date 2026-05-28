import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/View/screen/User/requests/requestpage.dart';
import 'package:project2/View/screen/User/userhome.dart';
import 'package:project2/View/screen/User/userprofile.dart';
import 'package:project2/homechattest.dart';

class ScreenContoller extends GetxController {
  int currentPage = 0;
  List<Widget> pagesList = [
    const UserHome(),
    const RequestPage(),
    const HomeChat(),
    const UserProfile(),
  ];

  List pageTitle = [
    "Home".tr,
    "Request".tr,
    "Chats".tr,
    "Profile".tr,
  ];

  List<IconData> pageIcon = [
    Icons.home,
    Icons.event_note,
    Icons.chat_rounded,
    Icons.person,
  ];

  changePage(i) {
    currentPage = i;

    update();
  }
}
