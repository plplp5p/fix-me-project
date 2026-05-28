import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorDelete {
  Database database = Database();
  ContractorDelete(this.database);
  deleteContractor(String email) async {
    var data = await database.postData(Applink.deleteContractor, {"email" : email});
    return data.fold((l) => l, (r) => r);
  }
}