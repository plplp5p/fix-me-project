import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class  UserForgetpasswordData{
  Database database = Database();
  UserForgetpasswordData(this.database);
  getForgetpassData(String email) async {
    var data = await database.postData(Applink.customerforgetpass, {
    "email" : email ,
     });
    return data.fold((l) => l, (r) => r);
  }
}