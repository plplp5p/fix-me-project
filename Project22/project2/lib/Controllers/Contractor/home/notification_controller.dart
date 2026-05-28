import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/Contractor/home/notifications_data.dart';
import 'package:project2/Model/model/Contractor/notificationmodel.dart';

class ContractorNotificationController extends GetxController {
  String? email;
  List<NotificationModel> notifications = [];
  Myservices myservices = Get.find();
  ContractorNotificationsData contractorNotiData =
      ContractorNotificationsData(Get.find());
  late String inquiryStatus;

  @override
  void onInit() {
    initialData();
    getNotifications();
    super.onInit();
  }

  initialData() {
    email = myservices.sharedPreferences.getString("workercontactoremail");
    print(email);
  }

  getNotifications() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await contractorNotiData.contractorNotiData(email!);
    inquiryStatus = respondingRequest(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List notiData = request['data'];
        notifications.addAll(notiData.map(
          (e) => NotificationModel.fromJson(e),
        ));
      } else {
        return InquiryStatus.sereverFailure;
      }
    }
    update();
  }
}
