import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Admin/workerpage_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class WorkerInfoPageController extends GetxController {
  WorkerInfo data = WorkerInfo(Get.find());
  List workerInfo = [];

  late String inquiryStatus;

  displayWorkerInfo() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await data.getWorkerData();
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        workerInfo.addAll(request['input']);
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    displayWorkerInfo();
    super.onInit();
  }

  goToWorkerDetailsPage(WorkerModel workerModel) {
    Get.toNamed("adminworkerdetailsinfo", arguments: {
      "workerModel": workerModel,
    });
  }
}
