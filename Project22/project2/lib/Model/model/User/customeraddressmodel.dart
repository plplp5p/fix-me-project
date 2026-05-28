class CutomerAddressModel {
  String? addressId;
  String? addressName;
  String? city;
  String? street;
  String? longitude;
  String? latitude;
  String? customerUsername;

  CutomerAddressModel(
      {this.addressId,
      this.addressName,
      this.city,
      this.street,
      this.longitude,
      this.latitude,
      this.customerUsername});

  CutomerAddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    city = json['city'];
    street = json['street'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    customerUsername = json['customer_username'];
  }


}