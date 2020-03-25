import 'package:flutter_cielo_ecommerce/src/Address.dart';

class Customer {
  String name;
  String identity;
  Address address;

  Customer({this.name, this.identity, this.address});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['Name'] as String;
    identity = json['Identity'] as String;
    address =
        json['Address'] != null ? new Address.fromJson(json['Address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Identity'] = this.identity;
    data['Address'] = data['Address'] == null ? null : this.address.toJson();
    return data;
  }
}
