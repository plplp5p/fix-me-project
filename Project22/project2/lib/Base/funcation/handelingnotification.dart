import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

handelNotification() {
  FirebaseMessaging.onMessage.listen((messages) {
    print(messages.notification!.title);
    print(messages.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(messages.notification!.title!, messages.notification!.body!);
  });
}
