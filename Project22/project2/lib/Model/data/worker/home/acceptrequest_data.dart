import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class AcceptrequsetData {
  Database database = Database();
  AcceptrequsetData(this.database);
  getAcceptrequset(String requestId, String contractorEmail , String conEmail ) async {
    var data = await database.postData(Applink.workeracceptrequest, {
      "request_id": requestId,
      "contractor_email": contractorEmail,
      "contractor_email2" : conEmail
    });
    return data.fold((l) => l, (r) => r);
  }

  getRejectrequset(String requestId) async {
    var data = await database.postData(Applink.workerrejectrequest, {
      "request_id": requestId,
    });
    return data.fold((l) => l, (r) => r);
  }
}
