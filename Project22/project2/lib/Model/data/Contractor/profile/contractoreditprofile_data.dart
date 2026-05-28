import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorEditProfileData {
  Database database = Database();
  ContractorEditProfileData(this.database);
  contractorEditData(String username , String firstname , String city , String zip , String street , String email) async {
    var request = await database.postData(Applink.contractorEditProfile, {
      "username": username,
      "firstname" : firstname,
      "city" : city,
      "zip" : zip,
      "street" : street,
      "email" : email
    });
    return request.fold((l) => l, (r) => r);
  }
}