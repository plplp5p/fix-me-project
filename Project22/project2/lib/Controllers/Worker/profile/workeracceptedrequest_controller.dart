import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/worker/profile/workeracceptedrequest_data.dart';
import 'package:project2/Model/model/Worker/requestmodel.dart';

class ViewacceptrequsetController extends GetxController {
  String? username;
  Myservices myservices = Get.find();
  List<RequestModel> requestmodel = [];
  ViewacceptrequsetData viewacceptrequsetData =
      ViewacceptrequsetData(Get.find());
  RequestModel? requestModel;

  @override
  void onInit() {
    initalUser();
    displayacceptedreq();
    super.onInit();
  }

  initalUser() {
    username = myservices.sharedPreferences.getString("workerusername");
  }

  late String inquiryStatus;

  displayacceptedreq() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await viewacceptrequsetData.getWorkerData(username!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List requests = request['input'];
        requestmodel.addAll(requests.map((e) => RequestModel.fromJson(e)));
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  goToRequsetdetalisinfo(RequestModel requestmodel) {
    Get.toNamed("Requsetdetalisinfo",
        arguments: {"requestmodel": requestmodel});
  }

  Donereq(String requestId) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await viewacceptrequsetData.getDonereques(requestId);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        requestmodel.removeWhere((e) => e.requestId == requestId);
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  goToTrakingPage(RequestModel requestModel) {
    Get.toNamed("workertraking", arguments: {"requestmodel": requestModel});
  }
}
