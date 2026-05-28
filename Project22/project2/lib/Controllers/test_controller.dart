import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/test.dart';

class TestController extends GetxController {
  late TextEditingController username;
  late TextEditingController firstname;
  late TextEditingController cont_ema;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController lice;
  String? cat;
  late String inquiryStatus;

  List wokerCategories = [];
   List workerValues = ["Carpenter" , "Driver" , "Electrician" , "Farmer" , "Mason" , "Mechanic" , "Painter"
    , "Plumber" , "Welder"
    ];

  @override
  void onInit() {
    username = TextEditingController();
    lice = TextEditingController();
    firstname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    cont_ema = TextEditingController();
    getWorkerCategories();
    super.onInit();
  }

  void chagecat(val) {
    cat = val;
    update();
  }

  @override
  void dispose() {
    lice.dispose();
    username.dispose();
    cont_ema.dispose();
    firstname.dispose;
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Test test = Test(Get.find());
  List data = [];

  bringData() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await test.getData(lice.text, username.text, firstname.text,
        email.text, cont_ema.text, password.text, cat!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.toNamed("firstpage");
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  getWorkerCategories() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await test.getcategories();
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        wokerCategories.addAll(request['input']);
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
