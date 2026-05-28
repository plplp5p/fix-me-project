import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class WorkerChatData {
  Database database = Database();
  WorkerChatData(this.database);
  getData(String username) async {
    var data = await database.postData(Applink.workerHomeChat, {
      "worker_username": username,
    });
    return data.fold((l) => l, (r) => r);
  }

  Future<Map<String, dynamic>> getLastMessage(String chatId) async {
    var data = await database.postData(Applink.lastmessage, {
      "chat_id": chatId,
    });

    return data.fold(
      (l) {
        return {'last_message': '$l'};
      },
      (r) {
        if (r['status'] == 'success' && r['data'].isNotEmpty) {
          var lastMessage = r['data'][0]['message']; 
          return {'last_message': lastMessage};
        } else {
          return {
            'last_message': 'No messages found'
          };
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
