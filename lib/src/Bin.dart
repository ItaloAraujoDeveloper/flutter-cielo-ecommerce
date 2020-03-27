// To parse this JSON data, do
//
//     final bin = binFromJson(jsonString);

import 'dart:convert';

class Bin {
  String status;
  String provider;
  String cardType;
  bool foreignCard;
  bool corporateCard;
  String issuer;
  String issuerCode;

  Bin({
    this.status,
    this.provider,
    this.cardType,
    this.foreignCard,
    this.corporateCard,
    this.issuer,
    this.issuerCode,
  });

  factory Bin.fromRawJson(String str) => Bin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bin.fromJson(Map<String, dynamic> json) => Bin(
        status: json["Status"],
        provider: json["Provider"],
        cardType: json["CardType"],
        foreignCard: json["ForeignCard"],
        corporateCard: json["CorporateCard"],
        issuer: json["Issuer"],
        issuerCode: json["IssuerCode"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Provider": provider,
        "CardType": cardType,
        "ForeignCard": foreignCard,
        "CorporateCard": corporateCard,
        "Issuer": issuer,
        "IssuerCode": issuerCode,
      };
}
