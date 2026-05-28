import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorAccept {
  Database database = Database();
  ContractorAccept(this.database);
  acceptContractor(String email) async {
    var data = await database.postData(Applink.acceptContractor , {"email" : email});
    return data.fold((l) => l, (r) => r);
  }
}