// lib/Controllers/Contractor/contractor_home_controller.dart
import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Contractor/home/contractorhome_data.dart';
import 'package:project2/Model/model/Worker/workermodel.dart';

class ContractorHomeController extends GetxController {
  String? username;
  String? firstname;
  String? email;
  List<WorkerModel> workers = [];
  Myservices myservices = Get.find();
  ContractorHomeData contractorHomeData = ContractorHomeData(Get.find());
  late String inquiryStatus;

  @override
  void onInit() {
    initialData();
    getWorkersReal();
    super.onInit();
  }

  initialData() {
    email = myservices.sharedPreferences.getString("workercontactoremail");
  }

  getWorkersReal() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await contractorHomeData.contractorhomeData(email!);
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List workersData = request['data'];
        workers.addAll(workersData.map(
          (e) => WorkerModel.fromJson(e),
        ));
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  goToWorkerDetails(WorkerModel workerModel) {
    Get.toNamed("Workerinfo", arguments: {"workerModel": workerModel});
  }

  goToSearcPage() {
    Get.toNamed("ContracrorSearchPage");
  }

  goToNotificationPage() {
    Get.toNamed("notifications");
  }
}
