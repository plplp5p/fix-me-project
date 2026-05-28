import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class MyOrdersData {
  Database database = Database();
  MyOrdersData(this.database);
  getorders(String username) async {
    var data = await database.postData(Applink.userorderpage, {
      "username" : username,     
     });
    return data.fold((l) => l, (r) => r);
  }

  getcompletedorders(String username) async {
    var data = await database.postData(Applink.completedorders , {
      "username" : username,     
     });
    return data.fold((l) => l, (r) => r);
  }

  deleteOrder(String requestid) async{
     var data = await database.postData(Applink.userdeleteorder, {
      "requestid" : requestid,     
     });
    return data.fold((l) => l, (r) => r);
  }
}