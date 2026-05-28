import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class UserSigninData {
  Database database = Database();

  UserSigninData(this.database);

  userSignData(
      String username, String firstName, String email, String password) async {
    var request = await database.postData(Applink.customerSignin, {
      "username": username,
      "firstname": firstName,
      "email": email,
      "password": password
    });
    return request.fold((l) => l, (r) => r);
  }
}
