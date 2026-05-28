import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorNotificationsData {
  Database database = Database();
  ContractorNotificationsData(this.database);
  contractorNotiData(String email) async {
    var request = await database.postData(Applink.contractorNotifications, {
      "email": email,
    });
    return request.fold((l) => l, (r) => r);
  }
}