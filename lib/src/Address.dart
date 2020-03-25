class Address {
  String street;
  String number;
  String complement;
  String zipCode;
  String district;
  String city;
  String state;
  String country;

  Address({
    this.street,
    this.number,
    this.complement,
    this.zipCode,
    this.district,
    this.city,
    this.state,
    this.country,
  });

  Address.fromJson(Map<String, dynamic> json) {
    Address(
        street: json['Street'] as String,
        number: json['Number'] as String,
        complement: json['Complement'] as String,
        zipCode: json['ZipCode'] as String,
        district: json['District'] as String,
        city: json['City'] as String,
        state: json['State'] as String,
        country: json['Country'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Street'] = this.street;
    data['Number'] = this.number;
    data['Complement'] = this.complement;
    data['ZipCode'] = this.zipCode;
    data['City'] = this.city;
    data['District'] = this.district;
    data['State'] = this.state;
    data['Country'] = this.country;
    return data;
  }
}
