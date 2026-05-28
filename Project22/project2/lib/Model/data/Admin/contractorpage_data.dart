import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ContractorPageData {
  Database database = Database();
  ContractorPageData (this.database);
  getContractorData() async {
    var data = await database.postData(Applink.dispalyContractorinfo, {});
    return data.fold((l) => l, (r) => r);
  }
}