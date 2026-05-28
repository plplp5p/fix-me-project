import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerhomeData {
  Database database = Database();
  WorkerhomeData(this.database);
  getWorkerData(String username) async {
    var data = await database.postData(Applink.workerhome, {
      "worker_username" : username
    });
    return data.fold((l) => l, (r) => r);
  }
  setUserAtmmpts(String username)async {
   var data = await database.postData(Applink.workerrresetuseratmmpts , {
    "username" : username
   });
   return data.fold((l) => l, (r) => r);
  }
}