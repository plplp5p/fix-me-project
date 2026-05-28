import 'package:get/get.dart';
import 'package:project2/Base/services/myservices.dart';

validateInput(String input) {
  Myservices myservices = Get.find();
  if (input.isEmpty) {
    return "can't be empty";
  }
  if (myservices.sharedPreferences.getString("lang") == "en") {
    if (!allowEnglish(input)) {
      return "Enter English Letters";
    }
  }
  if (myservices.sharedPreferences.getString("lang") == "ar") {
    if (!allowArabic(input)) {
      return "أدخل حروف عربيه";
    }
  }
}

bool allowEnglish(String val) {
  RegExp english = RegExp(r'^[a-zA-Z0-9\s.,:;!?()\-_]+$');
  return english.hasMatch(val);
}

allowArabic(String val) {
  RegExp arabic = RegExp(r'^[\u0600-\u06FF\s]+$');
  return arabic.hasMatch(val);
}

validInput(String value, String inputKind, int max, int min) {
  if (inputKind == "email") {
    if (!value.isEmail) {
      return "Not valid Email";
    }
  }
  if (inputKind == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not valid username";
    }
  }

  if (value.isEmpty) {
    return "can't be empty";
  }
  if (value.length > max) {
    
    return "Can't be larger than $max";
  }
  if (value.length < min) {
    return "Can't be less than $min";
  }
}
