import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/address/veiwaddress_data.dart';
import 'package:project2/Model/data/User/request/usercheckout_data.dart';
import 'package:project2/Model/model/User/customeraddressmodel.dart';

class UsercheckoutController extends GetxController {
  List<CutomerAddressModel> userAddress = [];

  late String inquiryStatus;
  CheckoutData checkoutData = CheckoutData(Get.find());

  String? username;
  String? addressid;
  Myservices myservices = Get.find();
  ViewAddressData viewAddressData = ViewAddressData(Get.find());

  String? payment;
  String? address;
  late String reuestid;

  intailUsername() {
    username = myservices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    reuestid = Get.arguments['request_id'];
    intailUsername();
    getAddressData();
    super.onInit();
  }

  onSelectAddress(String selectdAdd) {
    address = selectdAdd;
    update();
  }

  onSelectPayment(String pay) {
    payment = pay;
    update();
  }

  getAddressData() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await viewAddressData.viewAddesseData(username!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List address = request['input'];
        userAddress.addAll(address.map(
          (e) => CutomerAddressModel.fromJson(e),
        ));
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  chekout() async {
    if (payment == null)
      return Get.snackbar("Alert", "Please specify the payment method");
    if (address == null)
      return Get.snackbar("Alert", "Please select the address");
    inquiryStatus = InquiryStatus.lodaing;
    var request = await checkoutData.getcheckOut(payment!, address!, reuestid);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        Get.snackbar("Alert", "Your request has been added successfully");
        Get.offAllNamed("userHome");
      } else {
        return InquiryStatus.sereverFailure;
      }
    }

    update();
  }
}
