import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerCateData {
   Database database = Database();
   WorkerCateData(this.database);
   getData(String categoriesName) async {
    var data = await database.postData(Applink.customerWorkerCate, {
      "categories_name" : categoriesName
    });
    return data.fold((l) => l, (r) => r);
  }
}