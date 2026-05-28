import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/address/deleteaddress_data.dart';
import 'package:project2/Model/data/User/address/veiwaddress_data.dart';
import 'package:project2/Model/model/User/customeraddressmodel.dart';

class AddressPageController extends GetxController {
  List<CutomerAddressModel> userAddress = [];

  late String inquiryStatus;

  String? username;
  String? addressid;
  Myservices myservices = Get.find();
  ViewAddressData viewAddressData = ViewAddressData(Get.find());
  DeleteAddressData deleteAddressData = DeleteAddressData(Get.find());
  intailUsername() {
    username = myservices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    intailUsername();
    getAddressData();
    super.onInit();
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

  deleteAddress(String address_id) async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await deleteAddressData.addtAddressData(address_id);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        userAddress.removeWhere((e) => e.addressId == address_id);
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
