import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/request/userorder_data.dart';
import 'package:project2/Model/model/User/userordersmoder.dart';

class UserMyordersController extends GetxController {
  String? username;
  late String inquiryStatus;
  List<UserOrdersModel> userOrders = [];
  Myservices myservices = Get.find();

  MyOrdersData myOrdersData = MyOrdersData(Get.find());

  paymentMethode(String pay) {
    if (pay == '0') {
      return "Pay by card";
    } else if (pay == '1') {
      return "Pay in cash";
    }
  }

  orderStatus(String status) {
    if (status == '0') {
      return "Waiting for approval";
    } else if (status == '1') {
      return "Rejected";
    } else if (status == '2') {
      return "Accepted";
    } else if (status == '3') {
      return "Canceled";
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
    var request = await myOrdersData.getorders(username!);
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

  cancelOrder(String orderid) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await myOrdersData.deleteOrder(orderid);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        userOrders.removeWhere((e) => e.requestId == orderid);
        print("susecc");
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
