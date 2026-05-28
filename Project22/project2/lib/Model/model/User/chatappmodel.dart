class ChatAppModel {
  String? chatId;
  String? workerUsername;
  String? customerUsername;
  String? timeCraeted;

  ChatAppModel(
      {this.chatId,
      this.workerUsername,
      this.customerUsername,
      this.timeCraeted});

  ChatAppModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    workerUsername = json['worker_username'];
    customerUsername = json['customer_username'];
    timeCraeted = json['time_craeted'];
  }

  
}