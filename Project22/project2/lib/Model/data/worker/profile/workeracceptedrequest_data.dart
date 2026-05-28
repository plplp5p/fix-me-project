import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ViewacceptrequsetData {
  Database database = Database();
  ViewacceptrequsetData(this.database);
  getWorkerData(String username) async {
    var data = await database.postData(Applink.workereacceptedrquest, {
      "username" : username
    });
    return data.fold((l) => l, (r) => r);
  }

   getDonereques(String requestId) async {
    var data = await database.postData(Applink.workeredone, {
      "request_id": requestId,
    });
    return data.fold((l) => l, (r) => r);
  }
}

