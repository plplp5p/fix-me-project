import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContrctorforgetpasswordData {
  Database database = Database();
  ContrctorforgetpasswordData(this.database);
  getForgetpassData(String email) async {
    var data = await database.postData(Applink.contractorcheckemailforget, {
      "email": email,
    });
    return data.fold((l) => l, (r) => r);
  }
}