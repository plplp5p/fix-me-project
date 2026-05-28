class WorkerModel {
  String? workerId;
  String? userName;
  String? firstName;
  String? middelName;
  String? lastName;
  String? workerEmail;
  String? workerPassword;
  String? verifyCode;
  String? city;
  String? zip;
  String? street;
  String? license;
  String? workerCategories;
  String? workerApprove;
  String? adminId;
  String? contactorEmail;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImge;

  WorkerModel(
      {this.workerId,
      this.userName,
      this.firstName,
      this.middelName,
      this.lastName,
      this.workerEmail,
      this.workerPassword,
      this.verifyCode,
      this.city,
      this.zip,
      this.street,
      this.license,
      this.workerCategories,
      this.workerApprove,
      this.adminId,
      this.contactorEmail,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImge});

  WorkerModel.fromJson(Map<String, dynamic> json) {
    workerId = json['worker_id'];
    userName = json['user_name'];
    firstName = json['first_name'];
    middelName = json['middel_name'];
    lastName = json['last_name'];
    workerEmail = json['worker_email'];
    workerPassword = json['worker_password'];
    verifyCode = json['verify_code'];
    city = json['city'];
    zip = json['zip'];
    street = json['street'];
    license = json['license'];
    workerCategories = json['worker_categories'];
    workerApprove = json['worker_approve'];
    adminId = json['admin_id'];
    contactorEmail = json['contactor_email'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImge = json['categories_imge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['worker_id'] = this.workerId;
    data['user_name'] = this.userName;
    data['first_name'] = this.firstName;
    data['middel_name'] = this.middelName;
    data['last_name'] = this.lastName;
    data['worker_email'] = this.workerEmail;
    data['worker_password'] = this.workerPassword;
    data['verify_code'] = this.verifyCode;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['street'] = this.street;
    data['license'] = this.license;
    data['worker_categories'] = this.workerCategories;
    data['worker_approve'] = this.workerApprove;
    data['admin_id'] = this.adminId;
    data['contactor_email'] = this.contactorEmail;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_imge'] = this.categoriesImge;
    return data;
  }
}