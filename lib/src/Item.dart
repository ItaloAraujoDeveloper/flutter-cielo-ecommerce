import 'dart:convert';

import 'Passenger.dart';

class Item {
  String giftCategory;
  String hostHedge;
  String nonSensicalHedge;
  String obscenitiesHedge;
  String phoneHedge;
  String name;
  int quantity;
  String sku;
  int unitPrice;
  String risk;
  String timeHedge;
  String type;
  String velocityHedge;
  Passenger passenger;

  Item({
    this.giftCategory,
    this.hostHedge,
    this.nonSensicalHedge,
    this.obscenitiesHedge,
    this.phoneHedge,
    this.name,
    this.quantity,
    this.sku,
    this.unitPrice,
    this.risk,
    this.timeHedge,
    this.type,
    this.velocityHedge,
    this.passenger,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        giftCategory: json["GiftCategory"],
        hostHedge: json["HostHedge"],
        nonSensicalHedge: json["NonSensicalHedge"],
        obscenitiesHedge: json["ObscenitiesHedge"],
        phoneHedge: json["PhoneHedge"],
        name: json["Name"],
        quantity: json["Quantity"],
        sku: json["Sku"],
        unitPrice: json["UnitPrice"],
        risk: json["Risk"],
        timeHedge: json["TimeHedge"],
        type: json["Type"],
        velocityHedge: json["VelocityHedge"],
        passenger: Passenger.fromJson(json["Passenger"]),
      );

  Map<String, dynamic> toJson() => {
        "GiftCategory": giftCategory,
        "HostHedge": hostHedge,
        "NonSensicalHedge": nonSensicalHedge,
        "ObscenitiesHedge": obscenitiesHedge,
        "PhoneHedge": phoneHedge,
        "Name": name,
        "Quantity": quantity,
        "Sku": sku,
        "UnitPrice": unitPrice,
        "Risk": risk,
        "TimeHedge": timeHedge,
        "Type": type,
        "VelocityHedge": velocityHedge,
        "Passenger": passenger.toJson(),
      };
}
