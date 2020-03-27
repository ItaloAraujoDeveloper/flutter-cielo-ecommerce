import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/Address.dart';

class Customer {
  String name;
  String identity;
  String identityType;
  String email;
  DateTime birthdate;
  String mobile;
  String phone;
  Address address;
  Address deliveryAddress;
  Address billingAddress;

  Customer({
    this.name,
    this.identity,
    this.identityType,
    this.email,
    this.birthdate,
    this.mobile,
    this.phone,
    this.address,
    this.deliveryAddress,
    this.billingAddress,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["Name"] == null ? null : json["Name"],
        identity: json["Identity"] == null ? null : json["Identity"],
        identityType:
            json["IdentityType"] == null ? null : json["IdentityType"],
        email: json["Email"] == null ? null : json["Email"],
        birthdate: json["Birthdate"] == null
            ? null
            : DateTime.parse(json["Birthdate"]),
        mobile: json["Mobile"] == null ? null : json["Mobile"],
        phone: json["Phone"] == null ? null : json["Phone"],
        address:
            json["Address"] == null ? null : Address.fromJson(json["Address"]),
        deliveryAddress: json["DeliveryAddress"] == null
            ? null
            : Address.fromJson(json["DeliveryAddress"]),
        billingAddress: json["BillingAddress"] == null
            ? null
            : Address.fromJson(json["BillingAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Identity": identity == null ? null : identity,
        "IdentityType": identityType == null ? null : identityType,
        "Email": email == null ? null : email,
        "Birthdate": birthdate == null
            ? null
            : "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "Mobile": mobile == null ? null : mobile,
        "Phone": phone == null ? null : phone,
        "Address": address == null ? null : address.toJson(),
        "DeliveryAddress":
            deliveryAddress == null ? null : deliveryAddress.toJson(),
        "BillingAddress":
            billingAddress == null ? null : billingAddress.toJson(),
      };
}
