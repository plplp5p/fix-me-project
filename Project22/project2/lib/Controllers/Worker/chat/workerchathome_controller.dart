import 'dart:async';

import 'package:get/get.dart';
import 'package:project2/Base/class/inquirystatus.dart';
import 'package:project2/Base/funcation/respondingrequest.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/Model/data/worker/Chat/workerchathomr_data.dart';
import 'package:project2/Model/model/User/chatappmodel.dart';

class WorkerHomechatController extends GetxController {
  String? username;
  Myservices myservices = Get.find();
  late String inquiryStatus;
  WorkerChatData chatData = WorkerChatData(Get.find());
  List<ChatAppModel> users = [];
  Map<String, String> lastMessages = {};
  Map<String, String> unreadCounts = {};

  initaildata() {
    username = myservices.sharedPreferences.getString("workerusername");
  }

  @override
  void onInit() {
    pollingUnreadLastMessages();
    initaildata();
    getdata();
    super.onInit();
  }

  Timer? pollingTimer;

  void pollingUnreadLastMessages() {
    pollingTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      for (var chat in users) {
        await unReadMessages(chat.chatId!);
        await lastMessage(chat.chatId!);
      }
    });
  }

  getdata() async {
    inquiryStatus = InquiryStatus.lodaing;
    var request = await chatData.getData(username!);
    inquiryStatus = respondingRequest(request);
    print(request);
    if (InquiryStatus.success == inquiryStatus) {
      if (request['status'] == "success") {
        List chats = request['data'];
        users.addAll(chats.map((e) => ChatAppModel.fromJson(e)).toList());
        for (var user in users) {
          await lastMessage(user.chatId!);
          await unReadMessages(user.chatId!);
        }
      } else {
        inquiryStatus = InquiryStatus.sereverFailure;
      }
    }
    update();
  }

  lastMessage(String chatId) async {
    var request = await chatData.getLastMessage(chatId);
    lastMessages[chatId] = request['last_message'] ?? '';
    update();
  }

  unReadMessages(String chatId) async {
    var messages = await chatData.getData(username!);
    if (messages != null && messages['status'] == 'success') {
      for (var message in messages['data']) {
        if (message['chat_id'] == chatId) {
          break;
        }
      }
      var result = await chatData.unreadMessage(username, chatId);
      if (result != null && result['status'] == "success") {
        var unread = result['data'][0]['COUNT(*)'];
        unreadCounts[chatId] = unread;
      }
    }
    update();
  }

  readTheMessages(String chatId) async {
    var request = await chatData.getData(username!);
    if (request['status'] == 'success') {
      for (var message in request['data']) {
        if (message['chat_id'] == chatId) {
          break;
        }
      }
    }
    var read = await chatData.readMessage(username, chatId);
    if (read['status'] == "success") {
      await unReadMessages(chatId);
    }
    update();
  }

  updateLastMessage(String chatId, String newMessage) {
    lastMessages[chatId] = newMessage;
    update();
  }
}
