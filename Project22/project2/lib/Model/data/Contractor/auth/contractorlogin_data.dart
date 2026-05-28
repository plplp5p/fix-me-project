import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorLoginData {
  Database database = Database();
  ContractorLoginData(this.database);
  contractorLoginData(String email, String password) async {
    var request = await database.postData(Applink.contractorLogin, {
      "email": email,
      "password": password
    });
    return request.fold((l) => l, (r) => r);
  }
}