import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';
 
class ContrctorverfiyvoderestpassData {
  Database database = Database();
  ContrctorverfiyvoderestpassData(this.database);
 
  verifycodeRestPassData(String email, String verifyCode) async {
    var request = await database.postData(Applink.contractorverifycodeforget,
        {"email": email, "verifycode": verifyCode});
    return request.fold((l) => l, (r) => r);
  }
 
  resndverifycode(String email) async {
    var request = await database.postData(Applink.contractorresendverifycode, {
      "email": email,
    });
    return request.fold((l) => l, (r) => r);
  }
}