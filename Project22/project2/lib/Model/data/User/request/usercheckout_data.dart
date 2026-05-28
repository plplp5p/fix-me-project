import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class CheckoutData {
  Database database = Database();
  CheckoutData(this.database);
  getcheckOut(String paymethod , String addressid  , String requestid ) async {
    var data = await database.postData(Applink.usercheckout, {
      "pay_method" : paymethod,
      "addressid" : addressid,
      "requestid" : requestid,
     
     });
    return data.fold((l) => l, (r) => r);
  }
}