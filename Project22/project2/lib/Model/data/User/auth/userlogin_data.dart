import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class UserLoginData {
  Database database = Database();

  UserLoginData(this.database);

  userLoginData(String email, String password) async {
    var request = await database.postData(Applink.customerLogin, {
      "email": email,
      "password": password
    });
    return request.fold((l) => l, (r) => r);
  }
}