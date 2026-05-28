import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerverficodesignUpData {
  Database database = Database();
  WorkerverficodesignUpData(this.database);

  verifycodSignupData(String email, String verifyCode) async {
    var request = await database.postData(Applink.workerverifycodesiginup,
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