import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorHomeData {
  Database database = Database();
  ContractorHomeData(this.database);
  contractorhomeData(String email) async {
    var request = await database.postData(Applink.contractorHome, {
      "contractor_email": email,
    });
    return request.fold((l) => l, (r) => r);
  }
}

