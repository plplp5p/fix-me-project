import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class AddRequestData {
  Database database = Database();
  AddRequestData(this.database);
  insertRequest(String workerUsername , String cost , String service , String customerUsername) async {
    var data = await database.postData(Applink.userinsertRequset, {
      "worker_username" : workerUsername,
      "cost" : cost,
      "service" : service,
      "customer_username" : customerUsername
     });
    return data.fold((l) => l, (r) => r);
  }
}