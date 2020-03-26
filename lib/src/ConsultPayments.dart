// To parse this JSON data, do
//
//     final consultPayments = consultPaymentsFromJson(jsonString);

import 'dart:convert';

class ConsultPayments {
  int reasonCode;
  String reasonMessage;
  List<_Payment> payments;

  ConsultPayments({
    this.reasonCode,
    this.reasonMessage,
    this.payments,
  });

  factory ConsultPayments.fromRawJson(String str) =>
      ConsultPayments.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ConsultPayments.fromJson(Map<String, dynamic> json) =>
      ConsultPayments(
        reasonCode: json["ReasonCode"],
        reasonMessage: json["ReasonMessage"],
        payments: List<_Payment>.from(
            json["Payments"].map((x) => _Payment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ReasonCode": reasonCode,
        "ReasonMessage": reasonMessage,
        "Payments": List<dynamic>.from(payments.map((x) => x.toJson())),
      };
}

class _Payment {
  String paymentId;
  DateTime receveidDate;

  _Payment({
    this.paymentId,
    this.receveidDate,
  });
  factory _Payment.fromRawJson(String str) =>
      _Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory _Payment.fromJson(Map<String, dynamic> json) => _Payment(
        paymentId: json["PaymentId"],
        receveidDate: DateTime.parse(json["ReceveidDate"]),
      );

  Map<String, dynamic> toJson() => {
        "PaymentId": paymentId,
        "ReceveidDate": receveidDate.toIso8601String(),
      };
}
