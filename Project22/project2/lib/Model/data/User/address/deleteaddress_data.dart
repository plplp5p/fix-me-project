import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class DeleteAddressData {
  Database database = Database();
  DeleteAddressData(this.database);
  addtAddressData(String address_id) async {
    var data = await database.postData(Applink.customerDeleteaddress, {
      "address_id": address_id,
    });
    return data.fold((l) => l, (r) => r);
  }
}
