import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerforgetpasswordData {
  Database database = Database();
  WorkerforgetpasswordData(this.database);
  getForgetpassData(String email) async {
    var data = await database.postData(Applink.workercheckemail, {
      "email": email,
    });
    return data.fold((l) => l, (r) => r);
  }
}