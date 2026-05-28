import 'package:project2/Base/class/inquirystatus.dart';

respondingRequest(request) {
  if (request is String) {
    return request;
  } else {
    return InquiryStatus.success;
  }
}
