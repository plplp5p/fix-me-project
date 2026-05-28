class ContractorModel {
  String? userName;
  String? firstName;
  String? middelName;
  String? lastName;
  String? contactorEmial;
  String? contactorPassword;
  String? verifyCode;
  String? city;
  String? zip;
  String? street;
  String? license;
  String? contractorApprove;
  String? adminId;

  ContractorModel(
      {this.userName,
      this.firstName,
      this.middelName,
      this.lastName,
      this.contactorEmial,
      this.contactorPassword,
      this.verifyCode,
      this.city,
      this.zip,
      this.street,
      this.license,
      this.contractorApprove,
      this.adminId});

  ContractorModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    firstName = json['first_name'];
    middelName = json['middel_name'];
    lastName = json['last_name'];
    contactorEmial = json['contactor_emial'];
    contactorPassword = json['contactor_password'];
    verifyCode = json['verify_code'];
    city = json['city'];
    zip = json['zip'];
    street = json['street'];
    license = json['license'];
    contractorApprove = json['contractor_approve'];
    adminId = json['admin_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['first_name'] = this.firstName;
    data['middel_name'] = this.middelName;
    data['last_name'] = this.lastName;
    data['contactor_emial'] = this.contactorEmial;
    data['contactor_password'] = this.contactorPassword;
    data['verify_code'] = this.verifyCode;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['street'] = this.street;
    data['license'] = this.license;
    data['contractor_approve'] = this.contractorApprove;
    data['admin_id'] = this.adminId;
    return data;
  }
}