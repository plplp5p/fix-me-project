import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class  ContractorSearchPageData {
  Database database = Database();
  ContractorSearchPageData(this.database);
  getSearchData(String username , String contractorEmail) async {
    var data = await database.postData(Applink.contractorSearchPage, {
      "username" : username,
      "contactor_email" : contractorEmail
    });
    return data.fold((l) => l, (r) => r);
  }
}