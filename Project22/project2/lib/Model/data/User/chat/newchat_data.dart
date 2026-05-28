import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class NewChatData {
  Database database = Database();
  NewChatData(this.database);
  craeteNewChat(String customerusername , String workerusername) async {
    var data = await database.postData(Applink.newchat, {
      "worker_user" : workerusername,
      "customer_user" : customerusername
     });
    return data.fold((l) => l, (r) => r);
  }

}
