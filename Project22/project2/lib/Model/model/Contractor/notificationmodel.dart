class NotificationModel {
  String? notificationsId;
  String? title;
  String? content;
  String? contractor;
  String? timeDate;

  NotificationModel(
      {this.notificationsId,
      this.title,
      this.content,
      this.contractor,
      this.timeDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    title = json['title'];
    content = json['content'];
    contractor = json['contractor'];
    timeDate = json['time_date'];
  }


}