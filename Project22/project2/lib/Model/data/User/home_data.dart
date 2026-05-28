import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class  HomeData {
  Database database = Database();
  HomeData(this.database);
  getHomeData() async {
    var data = await database.postData(Applink.customerHome , {});
    return data.fold((l) => l, (r) => r);
  }
  setUserAtmmpts(String email)async {
   var data = await database.postData(Applink.resetuseratmmpts , {
    "email" : email
   });
   return data.fold((l) => l, (r) => r);
  }
}
