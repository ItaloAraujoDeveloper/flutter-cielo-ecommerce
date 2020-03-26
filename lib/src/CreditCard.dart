import 'dart:convert';

class CreditCard {
  String cardNumber;
  String holder;
  String expirationDate;
  String securityCode;
  String brand;
  String cardToken;
  String customerName;

  CreditCard({
    this.cardNumber,
    this.holder,
    this.expirationDate,
    this.securityCode,
    this.brand,
    this.cardToken,
    this.customerName,
  });

  factory CreditCard.token(
      {String cardToken, String securityCode, String brand}) {
    return CreditCard(
        cardToken: cardToken, securityCode: securityCode, brand: brand);
  }
  factory CreditCard.fromRawJson(String str) =>
      CreditCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
      cardNumber: json['CardNumber'] as String,
      holder: json['Holder'] as String,
      expirationDate: json['ExpirationDate'] as String,
      securityCode: json['SecurityCode'] as String,
      brand: json['Brand'] as String,
      customerName: json['CustomerName'] as String,
      cardToken: json['CardToken'] as String);

  Map<String, dynamic> toJson() => {
        "CardNumber": cardNumber,
        "Holder": holder,
        "ExpirationDate": expirationDate,
        "SecurityCode": securityCode,
        "Brand": brand,
        "SecurityCode": securityCode,
        "CustomerName": customerName,
        "CardToken": cardToken,
      };
}
