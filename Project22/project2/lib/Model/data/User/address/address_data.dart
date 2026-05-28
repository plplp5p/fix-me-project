import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class AddressData {
  Database database = Database();
  AddressData(this.database);
  addtAddressData(String user_name , String address_name , String city , String street , String latitude , String longitude) async{
   var data = await database.postData(Applink.customerAddAddress , {
    "address_name" : address_name,
    "city" : city,
    "street" : street,
    "latitude" : latitude,
    "longitude" : longitude,
    "customer_username" : user_name
   });
    return data.fold((l) => l, (r) => r);
  }
}
