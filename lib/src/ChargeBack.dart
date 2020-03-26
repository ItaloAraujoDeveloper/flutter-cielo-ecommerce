import 'dart:convert';

class Chargeback {
  int amount;
  String caseNumber;
  DateTime date;
  String reasonCode;
  String reasonMessage;
  String status;
  String rawData;

  Chargeback({
    this.amount,
    this.caseNumber,
    this.date,
    this.reasonCode,
    this.reasonMessage,
    this.status,
    this.rawData,
  });

  factory Chargeback.fromRawJson(String str) =>
      Chargeback.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chargeback.fromJson(Map<String, dynamic> json) => Chargeback(
        amount: json["Amount"],
        caseNumber: json["CaseNumber"],
        date: DateTime.parse(json["Date"]),
        reasonCode: json["ReasonCode"],
        reasonMessage: json["ReasonMessage"],
        status: json["Status"],
        rawData: json["RawData"],
      );

  Map<String, dynamic> toJson() => {
        "Amount": amount,
        "CaseNumber": caseNumber,
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "ReasonCode": reasonCode,
        "ReasonMessage": reasonMessage,
        "Status": status,
        "RawData": rawData,
      };
}
