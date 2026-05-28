import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class ChatData {
  Database database = Database();
  ChatData(this.database);
  getData(String username) async {
    var data = await database.postData(Applink.testchat, {
      "customer_user": username,
    });
    return data.fold((l) => l, (r) => r);
  }

  getMessages(String chat) async {
    var data = await database.postData(Applink.testgetmasseges, {
      "chat_id": chat,
    });
    return data.fold((l) => l, (r) => r);
  }

  senMessage(String message, String chat_id, String sender,
      String receiver_username) async {
    var data = await database.postData(Applink.testchatadd, {
      "message": message,
      "chat_id": chat_id,
      "sender_username": sender,
      "receiver_username": receiver_username
    });
    return data.fold((l) => l, (r) => r);
  }

  Future<Map<String, dynamic>> getLastMessage(String chatId) async {
    var data = await database.postData(Applink.lastmessage, {
      "chat_id": chatId,
    });

    return data.fold(
      (l) {
        return {'': 'no message'};
      },
      (r) {
        if (r['status'] == 'success' && r['data'].isNotEmpty) {
          var lastMessage = r['data'][0]['message'];
          return {'last_message': lastMessage};
        } else {
          return {'last_message': ' '};
        }
      },
    );
  }

  unreadMessage(var username, var chatId) async {
    var data = await database.postData(Applink.unreadmessage, {
      "chat_id": chatId,
      "receiver_username": username,
    });
    return data.fold((l) => l, (r) => r);
  }

  readMessage(var username, var chatId) async {
    var data = await database.postData(Applink.readthemessages, {
      "chat_id": chatId,
      "receiver_username": username,
    });
    return data.fold((l) => l, (r) => r);
  }
}
