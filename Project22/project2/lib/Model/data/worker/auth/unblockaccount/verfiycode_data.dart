import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerverficodeopenData {
  Database database = Database();
  WorkerverficodeopenData(this.database);

  verifycodeReopenAccuntData(String email, String verifyCode) async {
    var request = await database.postData(Applink.workerunaccountverfiy,
        {"email": email, "verifycode": verifyCode});
    return request.fold((l) => l, (r) => r);
  }

  resndverifycode(String email) async {
    var request = await database.postData(Applink.workerresendverfiycode , {
      "email": email,
    });
    return request.fold((l) => l, (r) => r);
  }
}