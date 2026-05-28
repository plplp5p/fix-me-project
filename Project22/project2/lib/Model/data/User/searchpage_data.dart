import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class  SearchPageData {
  Database database = Database();
  SearchPageData(this.database);
  getSearchPageData(String username) async {
    var data = await database.postData(Applink.customerSearch , {
      "username" : username
    });
    return data.fold((l) => l, (r) => r);
  }
}