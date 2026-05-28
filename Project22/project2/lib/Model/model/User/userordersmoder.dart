class UserOrdersModel {
  String? requestId;
  String? cost;
  String? status;
  String? service;
  String? paymentMethod;
  String? addressId;
  String? requestTimeDate;
  String? workerUsername;
  String? customerUsername;

  UserOrdersModel(
      {this.requestId,
      this.cost,
      this.status,
      this.service,
      this.paymentMethod,
      this.addressId,
      this.requestTimeDate,
      this.workerUsername,
      this.customerUsername});

  UserOrdersModel.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    cost = json['cost'];
    status = json['status'];
    service = json['service'];
    paymentMethod = json['payment_method'];
    addressId = json['address_id'];
    requestTimeDate = json['request_time_date'];
    workerUsername = json['worker_username'];
    customerUsername = json['customer_username'];
  }

 
}