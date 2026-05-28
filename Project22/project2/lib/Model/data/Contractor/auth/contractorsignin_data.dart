import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorSigninData {
  Database database = Database();
  ContractorSigninData(this.database);
  contractorSignData(
      String licennumber, String username, String firstName, String email, String password) async {
    var request = await database.postData(Applink.contractorSignin, {
      "licennumber" : licennumber,
      "username": username,
      "firstname": firstName,
      "email": email,
      "password": password
    });
    return request.fold((l) => l, (r) => r);
  }
}
