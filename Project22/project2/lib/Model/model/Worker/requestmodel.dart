class RequestModel {
  String? requestId;
  String? cost;
  String? status;
  String? service;
  String? paymentMethod;
  String? requestAddress;
  String? requestTimeDate;
  String? workerUsername;
  String? customerUsername;
  String? addressId;
  String? addressName;
  String? city;
  String? street;
  String? longitude;
  String? latitude;
  String? customerusername;

  RequestModel(
      {this.requestId,
      this.cost,
      this.status,
      this.service,
      this.paymentMethod,
      this.requestAddress,
      this.requestTimeDate,
      this.workerUsername,
      this.customerUsername,
      this.addressId,
      this.addressName,
      this.city,
      this.street,
      this.longitude,
      this.latitude,
      this.customerusername});

  RequestModel.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    cost = json['cost'];
    status = json['status'];
    service = json['service'];
    paymentMethod = json['payment_method'];
    requestAddress = json['request_address'];
    requestTimeDate = json['request_time_date'];
    workerUsername = json['worker_username'];
    customerUsername = json['customer_username'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    city = json['city'];
    street = json['street'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    customerusername = json['customerusername'];
  }

}