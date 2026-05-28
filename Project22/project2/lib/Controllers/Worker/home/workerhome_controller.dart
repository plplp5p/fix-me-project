import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/worker/home/workerhome_data.dart';
import 'package:project2/Model/model/Worker/requestmodel.dart';

class WorkerhomeController extends GetxController {
  WorkerhomeData data = WorkerhomeData(Get.find());
  List<RequestModel> requestmodel = [];
  String? username;
  Myservices myservices = Get.find();
  initalusername() {
    username = myservices.sharedPreferences.getString("workerusername");

  }

  @override
  void onInit() {
    initalusername();
    displayRequest();
    super.onInit();
  }

  late String inquiryStatus;

  displayRequest() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await data.getWorkerData(username!);
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

   reSetUserAtmmpts() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await data.setUserAtmmpts(username!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        print("success");
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  goToRequsetdetalisinfo(RequestModel requestmodel) {
    Get.toNamed("requsetdetalisinfo",
        arguments: {"requestmodel": requestmodel});
  }
}
