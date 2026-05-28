import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/View/screen/Worker/chat/chatHome.dart';
import 'package:project2/View/screen/Worker/home/workerhome.dart';
import 'package:project2/View/screen/Worker/profile/workerprofile.dart';

class WokerScreenContoller extends GetxController {
  int currentPage = 0;


   final List<String> pageControllers = [
  
    "WorkerChatController",
  
  ];
  List<Widget> pagesList = [
    const WorkerHome(),
    const WorkerHomeChat(),
    const WorkerProfile()
  ];

  List pageTitle = [
    "Home".tr,
    "Chats".tr,
    "Profile".tr,
  ];

  List<IconData> pageIcon = [
    Icons.home,
    Icons.chat_rounded,
    Icons.person,
  ];

  changePage(i) {
    currentPage = i;
    
    update();
  }
}
