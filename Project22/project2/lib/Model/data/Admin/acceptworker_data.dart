import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerAccept {
  Database database = Database();
 WorkerAccept(this.database);
  acceptWorker(String email) async {
    var data = await database.postData(Applink.acceptWorkerInSystem, {"email" : email});
    return data.fold((l) => l, (r) => r);
  }
}