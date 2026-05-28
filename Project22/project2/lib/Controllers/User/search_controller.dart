import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/User/searchpage_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class UserSearchController extends GetxController {
  GlobalKey<FormState> mykey1 = GlobalKey<FormState>();
  late TextEditingController username;
  SearchPageData searchPageData = SearchPageData(Get.find());
  List<WorkerModel> workersList = [];
  late String inquiryStatus;
  bool? userfound;
  bool search = false;

  @override
  void onInit() {
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    super.dispose();
  }

  serachFound() {
    userfound = true;
    update();
  }

  serachNotFound() {
    userfound = false;
    update();
  }

  onChangeusername(String val) {
    if (val == "") {
      return "";
    }
    if (mykey1.currentState!.validate()) {
      username.text = val;
      getUsers();
    }
  }

  getUsers() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await searchPageData.getSearchPageData(username.text);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        workersList.clear();
        serachFound();
        List workerRequest = request['user'];
        workersList.addAll(workerRequest.map(
          (e) => WorkerModel.fromJson(e),
        ));
      } else {
        serachNotFound();
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  goToWorkerDetails(WorkerModel workerModel) {
    Get.toNamed("userworkerdetailsinfo",
        arguments: {"WorkerModel": workerModel});
  }
}
