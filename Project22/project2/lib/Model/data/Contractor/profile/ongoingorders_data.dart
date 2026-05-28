import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorOnGoingOrdersData {
  Database database = Database();
  ContractorOnGoingOrdersData(this.database);
  contractorOrdersData(String email) async {
    var request = await database.postData(Applink.contractorOngoinorders, {
      "email": email,
    });
    return request.fold((l) => l, (r) => r);
  }
}