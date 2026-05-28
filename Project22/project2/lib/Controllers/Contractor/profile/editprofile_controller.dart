import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Contractor/profile/contractoreditprofile_data.dart';

class EditprofileController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController street = TextEditingController();

  String? email;
  Myservices myservices = Get.find();
  ContractorEditProfileData contractorEditProfileData =
      ContractorEditProfileData(Get.find());
  late String inquiryStatus;

  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();

  intial() {
    email = Get.arguments['email'];
    username.text = Get.arguments['username'] ?? "";
    firstname.text = Get.arguments['firstname'] ?? "";
    city.text = Get.arguments['city'] ?? "";
    zip.text = Get.arguments['zip'] ?? "";
    street.text = Get.arguments['street'] ?? "";
    print(username);
  }

  @override
  void onInit() {
    intial();
    super.onInit();
  }

  
  onChangeusername(String val) {
    if (mykey1.currentState!.validate()) {
      username.text = val;
    }
  }

  editData() async {
    if (username.text.isEmpty || firstname.text.isEmpty) {
      return Get.snackbar("Alert", "Username and First Name cannot be empty");
    }
    inquiryStatus = InquiryStatus.lodaing;
    var request = await contractorEditProfileData.contractorEditData(
        username.text,
        firstname.text,
        city.text,
        zip.text,
        street.text,
        email!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        myservices.sharedPreferences
            .setString("contractorusername", username.text);
        myservices.sharedPreferences
            .setString("contractorfirstname", firstname.text);
        myservices.sharedPreferences.setString("contractorcity", city.text);
        myservices.sharedPreferences.setString("contractorzip", zip.text);
        myservices.sharedPreferences.setString("contractorstreet", street.text);
        Get.offAllNamed("contractorhome");
        print("success");
      } else if (request['status'] == "failure" &&
          request["message"] == "User found") {
        Get.snackbar("Error", "User Found");
      } else {
        Get.offAllNamed("contractorhome");
      }
      return InquiryStatus.sereverFailure;
    }
    update();
  }
}
