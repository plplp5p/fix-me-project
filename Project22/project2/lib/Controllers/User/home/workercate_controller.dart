import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/User/workercate_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class WorkercateController extends GetxController {
  late String inquiryStatus;
  String? categoriesname;
  String? categoriesnamear;
  List worker = [];
  WorkerCateData workerCateData = WorkerCateData(Get.find());

  intaialData() {
    categoriesname = Get.arguments['categories_name'];
    categoriesnamear = Get.arguments['categories_name_ar'];
  }

  @override
  void onInit() {
    intaialData();
    getWrokers();
    super.onInit();
  }

  getWrokers() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await workerCateData.getData(categoriesname!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        worker.addAll(request['input']);
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
  

  goToWorkerDetails(WorkerModel workerModel) {
    Get.offNamed("userworkerdetailsinfo",
        arguments: {"WorkerModel": workerModel});
  }

   goToSearchPage() {
    Get.toNamed("searchpage");
  }
}
