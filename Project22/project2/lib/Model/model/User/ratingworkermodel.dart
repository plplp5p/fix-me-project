class RatingWorkerModel {
  String? customerUsername;
  String? workerUsername;
  String? comment;
  String? rate;

  RatingWorkerModel(
      {this.customerUsername, this.workerUsername, this.comment, this.rate});

  RatingWorkerModel.fromJson(Map<String, dynamic> json) {
    customerUsername = json['customer_username'];
    workerUsername = json['worker_username'];
    comment = json['comment'];
    rate = json['rate'];
  }

}