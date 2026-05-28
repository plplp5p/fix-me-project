import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ConrtctorreopenaccountData {
  Database database = Database();
  ConrtctorreopenaccountData(this.database);
  getData(String email) async {
    var data = await database.postData(Applink.contractorchechemailunblock, {
      "email": email,
    });
    return data.fold((l) => l, (r) => r);
  }
}