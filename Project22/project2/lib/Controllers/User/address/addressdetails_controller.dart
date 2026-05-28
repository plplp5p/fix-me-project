import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/address/address_data.dart';

class AddressDetailsController extends GetxController {
  //keys
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey2 = GlobalKey<FormState>();
  GlobalKey<FormState> mykey3 = GlobalKey<FormState>();
  //Input
  TextEditingController? areaname;
  TextEditingController? city;
  TextEditingController? street;
  String? username;
  String? latitude;
  String? longitude;
  //Services
  Myservices myservices = Get.find();

  late String inquiryStatus;
  AddressData addressData = AddressData(Get.find());

  inialLatLong() {
    latitude = Get.arguments['latitude'];
    longitude = Get.arguments['longitude'];
    username = myservices.sharedPreferences.getString("username");
    print(latitude);
    print(longitude);
  }

  @override
  void onInit() {
    city = TextEditingController();
    areaname = TextEditingController();
    street = TextEditingController();
    inialLatLong();
    super.onInit();
  }

  onChangeCity(String val) {
    if (mykey2.currentState!.validate()) {
      city!.text = val;
    }
  }

  onChangeStreet(String val) {
    if (mykey3.currentState!.validate()) {
      street!.text = val;
    }
  }

  onChangeAreaName(String val) {
    if (mykey1.currentState!.validate()) {
      areaname!.text = val;
    }
  }

  insertAddressData() async {
     if (city!.text.isEmpty &&
        street!.text.isEmpty &&
        areaname!.text.isEmpty) return Get.snackbar("Alert", "Please complete the required fields");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await addressData.addtAddressData(username!, areaname!.text,
        city!.text, street!.text, latitude!, longitude!);
    inquiryStatus = respondingRequest(request);
    print(request);
    print(username);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.offAllNamed("userHome");
      } else {
        return InquiryStatus.sereverFailure;
      }

      update();
    }
  }
}
