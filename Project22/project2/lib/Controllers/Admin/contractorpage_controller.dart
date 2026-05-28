import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Model/data/Admin/contractorpage_data.dart';
import 'package:project2/Model/model/Contractor/contractormodel.dart';

class ContractorInfoPageController extends GetxController {
  ContractorPageData data = ContractorPageData(Get.find());
  List contractorData = [];

  late String inquiryStatus;

  @override
  void onInit() {
    displayContractorInfo();
    super.onInit();
  }

  displayContractorInfo() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await data.getContractorData();
    print(request);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        contractorData.addAll(request['input']);
      } else {
        InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  goToContractorDetailsInfo(ContractorModel contractorModel) {
    Get.toNamed("admincontractordetailsinfo" , arguments: {
      "contractorModel" : contractorModel
    } );
  }
}
