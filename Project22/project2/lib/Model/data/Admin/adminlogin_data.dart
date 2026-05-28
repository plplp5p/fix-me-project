import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class AdminloginData {
  Database database = Database();
  AdminloginData(this.database);

  loginData(String email, String password) async {
    var data = await database.postData(Applink.adminlogin, {"email": email, "password": password});
    return data.fold((l) => l, (r) => r);
  }
}
