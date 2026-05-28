import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class VerifycodesigninData {
  Database database = Database();
  VerifycodesigninData(this.database);

  verifycodesigninData(String email, String verifyCode) async {
    var request = await database.postData(Applink.contractorverifycodesginup,
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