import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/User/home_data.dart';

class HomeController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  late String inquiryStatus;
  String? email;
  Myservices myservices = Get.find();
  initialEmial() {
    email = myservices.sharedPreferences.getString("customeremail");
  }

  @override
  void onInit() {
    initialEmial();
    getHomedata();
    reSetUserAtmmpts();
    super.onInit();
  }

  getHomedata() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await homeData.getHomeData();
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        categories.addAll(request["categories"]);
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  reSetUserAtmmpts() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await homeData.setUserAtmmpts(email!);
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

  goToWorker(String categoriesname, String categoriesnameAr) {
    Get.toNamed("workercategories", arguments: {
      "categories_name": categoriesname,
      "categories_name_ar": categoriesnameAr
    });
  }

  goToSearchPage() {
    Get.toNamed("searchpage");
  }
}
