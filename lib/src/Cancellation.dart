// To parse this JSON data, do
//
//     final cancellation = cancellationFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/Link.dart';

class Cancellation {
  int status;
  int reasonCode;
  String reasonMessage;
  String providerReturnCode;
  String providerReturnMessage;
  String returnCode;
  String returnMessage;
  List<Link> links;

  Cancellation({
    this.status,
    this.reasonCode,
    this.reasonMessage,
    this.providerReturnCode,
    this.providerReturnMessage,
    this.returnCode,
    this.returnMessage,
    this.links,
  });

  factory Cancellation.fromRawJson(String str) =>
      Cancellation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        status: json["Status"] == null ? null : json["Status"],
        reasonCode: json["ReasonCode"] == null ? null : json["ReasonCode"],
        reasonMessage:
            json["ReasonMessage"] == null ? null : json["ReasonMessage"],
        providerReturnCode: json["ProviderReturnCode"] == null
            ? null
            : json["ProviderReturnCode"],
        providerReturnMessage: json["ProviderReturnMessage"] == null
            ? null
            : json["ProviderReturnMessage"],
        returnCode: json["ReturnCode"] == null ? null : json["ReturnCode"],
        returnMessage:
            json["ReturnMessage"] == null ? null : json["ReturnMessage"],
        links: json["Links"] == null
            ? null
            : List<Link>.from(json["Links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status == null ? null : status,
        "ReasonCode": reasonCode == null ? null : reasonCode,
        "ReasonMessage": reasonMessage == null ? null : reasonMessage,
        "ProviderReturnCode":
            providerReturnCode == null ? null : providerReturnCode,
        "ProviderReturnMessage":
            providerReturnMessage == null ? null : providerReturnMessage,
        "ReturnCode": returnCode == null ? null : returnCode,
        "ReturnMessage": returnMessage == null ? null : returnMessage,
        "Links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toJson())),
      };
}
