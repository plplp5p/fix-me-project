import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerLoginData {
  Database database = Database();

  WorkerLoginData(this.database);

  workerLoginData(String email, String password) async {
    var request = await database.postData(Applink.workerLogin, {
      "email": email,
      "password": password
    });
    return request.fold((l) => l, (r) => r);
  }
}