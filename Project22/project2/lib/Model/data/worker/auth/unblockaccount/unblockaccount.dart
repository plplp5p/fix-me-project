import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerreemailopenaccountData {
  Database database = Database();
  WorkerreemailopenaccountData(this.database);
  getData(String email) async {
    var data = await database.postData(Applink.workerunaccount, {
      "email": email,
    });
    return data.fold((l) => l, (r) => r);
  }
}