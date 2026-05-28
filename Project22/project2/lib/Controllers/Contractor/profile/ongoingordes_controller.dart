import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Contractor/profile/ongoingorders_data.dart';
import 'package:project2/Model/model/User/userordersmoder.dart';

class OnGoingOrdesController extends GetxController {
  String? email;
  late String inquiryStatus;
  List<UserOrdersModel> userOrders = [];

  Myservices myservices = Get.find();
  ContractorOnGoingOrdersData OrdersData =
      ContractorOnGoingOrdersData(Get.find());

  paymentMethode(String pay) {
    if (pay == '0') {
      return "Pay by card";
    } else if (pay == '1') {
      return "Pay in cash";
    }
  }

  intiializeUsername() {
    email = myservices.sharedPreferences.getString("workercontactoremail");
  }

  @override
  void onInit() {
    intiializeUsername();
    getOrders();
    super.onInit();
  }

  getOrders() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await OrdersData.contractorOrdersData(email!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List orders = request['data'];
        userOrders.addAll(orders.map(
          (e) => UserOrdersModel.fromJson(e),
        ));
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
