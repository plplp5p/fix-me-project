import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ReOpenAccountData {
  Database database = Database();
  ReOpenAccountData(this.database);
  getData(String email) async {
    var data = await database.postData(Applink.customerErOpenAccount, {
    "email" : email ,
     });
    return data.fold((l) => l, (r) => r);
  }
}