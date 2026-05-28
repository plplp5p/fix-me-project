import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerEditProfileData {
  Database database = Database();
  WorkerEditProfileData(this.database);
  workerEditData(String username , String firstname , String city , String zip , String street , String email) async {
    var request = await database.postData(Applink.workereditprofile, {
      "username": username,
      "firstname" : firstname,
      "city" : city,
      "zip" : zip,
      "street" : street,
      "email" : email
    });
    return request.fold((l) => l, (r) => r);
  }
}