import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/request/rating_data.dart';
import 'package:project2/Model/data/User/request/userorder_data.dart';
import 'package:project2/Model/model/User/userordersmoder.dart';

class UserCompeletedOrdersController extends GetxController {
  String? username;
  late String inquiryStatus;
  List<UserOrdersModel> userOrders = [];
  RatingWorkerData ratingWorkerData = RatingWorkerData(Get.find());
  Myservices myservices = Get.find();
  double? rate;
  MyOrdersData myOrdersData = MyOrdersData(Get.find());

  paymentMethode(String pay) {
    if (pay == '0') {
      return "Pay by card";
    } else if (pay == '1') {
      return "Pay in cash";
    }
  }

  intiializeUsername() {
    username = myservices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    intiializeUsername();
    getOrders();
    super.onInit();
  }

  getOrders() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await myOrdersData.getcompletedorders(username!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List orders = request['input'];
        userOrders.addAll(orders.map(
          (e) => UserOrdersModel.fromJson(e),
        ));
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  ratingWorkerService(
      String workerusername, rate, String comment) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await ratingWorkerData.ratingWorker(
        workerusername, comment, rate.toString(), username!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
