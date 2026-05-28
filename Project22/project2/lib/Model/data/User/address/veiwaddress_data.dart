import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ViewAddressData {
  Database database = Database();
  ViewAddressData(this.database);
  viewAddesseData(String user_name) async{
   var data = await database.postData(Applink.customerViewAddress , {
    "customer_username" : user_name
   });
    return data.fold((l) => l, (r) => r);
  }
}