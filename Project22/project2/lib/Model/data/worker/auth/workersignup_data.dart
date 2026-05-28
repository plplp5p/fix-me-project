import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerSignupData {
  Database database = Database();
  WorkerSignupData(this.database);
  getData(String licennumber , String username , String firstname , String email , String contactor_email , String password , String categoties) async {
    var data = await database.postData(Applink.workerSignin, {
    "licennumber" : licennumber,
    "username" : username,
    "firstname" : firstname ,
    "email" : email ,
    "contactor_email" : contactor_email,
    "password" : password,
    "categoties" : categoties

     });
    return data.fold((l) => l, (r) => r);
  }

  getcategories() async{
     var data = await database.postData(Applink.workercategoriesSignup, {});
    return data.fold((l) => l, (r) => r);
  }
}
