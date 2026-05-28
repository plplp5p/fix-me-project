import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class RestpasswordData {
  Database database = Database();
  RestpasswordData(this.database);

  getRestPasswordData(String email, String password) async {
    var response = await database.postData(Applink.workerrestpassword , {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}