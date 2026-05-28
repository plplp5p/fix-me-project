import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/testtheinternetconnection.dart';
import 'package:http/http.dart' as http;

class Database {
  Future<Either<String, Map>> postData(String phpPage, Map input) async {
    if (await testTheInternetConnection()) {
      var request = await http.post(Uri.parse(phpPage), body: input);
      if (request.statusCode == 200 || request.statusCode == 201) {
        Map requestbody = jsonDecode(request.body);
        return Right(requestbody);
      } else {
        return left(InquiryStatus.sereverFailure);
      }
    } else {
      return left(InquiryStatus.internetFailure);
    }
  }
}
