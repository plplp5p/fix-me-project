import 'dart:io';
testTheInternetConnection()
 async {
  try {
    //اختبار اتصال بموقع قوقل للتاكد من موجود الانترنت
    var internet = await InternetAddress.lookup("google.com");
    if (internet.isNotEmpty && internet[0].rawAddress.isNotEmpty) {
      return true;
    }
    //   عشان الخطأ المتوقع انه لا يوجد اتصال بالانترنتSocketException من نوع 
  }on SocketException catch (_) {
    // لا يوجد اتصال
    return false;
  }
}
