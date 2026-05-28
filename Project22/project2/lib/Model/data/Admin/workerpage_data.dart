import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerInfo {
  Database database = Database();
  WorkerInfo(this.database);
  getWorkerData() async {
    var data = await database.postData(Applink.dispalyworkerifon, {});
    return data.fold((l) => l, (r) => r);
  }
}