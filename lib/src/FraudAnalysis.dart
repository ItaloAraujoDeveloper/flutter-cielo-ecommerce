import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/Browser.dart';
import 'package:flutter_cielo_ecommerce/src/Cart.dart';
import 'package:flutter_cielo_ecommerce/src/MerchantDefinedField.dart';
import 'package:flutter_cielo_ecommerce/src/Shipping.dart';
import 'package:flutter_cielo_ecommerce/src/Travel.dart';

class FraudAnalysis {
  String provider;
  String sequence;
  String sequenceCriteria;
  bool captureOnLowRisk;
  bool voidOnHighRisk;
  int totalOrderAmount;
  String fingerPrintId;
  Browser browser;
  Cart cart;
  List<MerchantDefinedField> merchantDefinedFields;
  Shipping shipping;
  Travel travel;

  FraudAnalysis({
    this.provider,
    this.sequence,
    this.sequenceCriteria,
    this.captureOnLowRisk,
    this.voidOnHighRisk,
    this.totalOrderAmount,
    this.fingerPrintId,
    this.browser,
    this.cart,
    this.merchantDefinedFields,
    this.shipping,
    this.travel,
  });

  factory FraudAnalysis.fromRawJson(String str) =>
      FraudAnalysis.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FraudAnalysis.fromJson(Map<String, dynamic> json) => FraudAnalysis(
        provider: json["Provider"],
        sequence: json["Sequence"],
        sequenceCriteria: json["SequenceCriteria"],
        captureOnLowRisk: json["CaptureOnLowRisk"],
        voidOnHighRisk: json["VoidOnHighRisk"],
        totalOrderAmount: json["TotalOrderAmount"],
        fingerPrintId: json["FingerPrintId"],
        browser:
            json["Browser"] == null ? null : Browser.fromJson(json["Browser"]),
        cart: json["Cart"] == null ? null : Cart.fromJson(json["Cart"]),
        merchantDefinedFields: json["MerchantDefinedFields"] == null
            ? null
            : List<MerchantDefinedField>.from(json["MerchantDefinedFields"]
                .map((x) => MerchantDefinedField.fromJson(x))),
        shipping: json["Shipping"] == null
            ? null
            : Shipping.fromJson(json["Shipping"]),
        travel: json["Travel"] == null ? null : Travel.fromJson(json["Travel"]),
      );

  Map<String, dynamic> toJson() => {
        "Provider": provider,
        "Sequence": sequence,
        "SequenceCriteria": sequenceCriteria,
        "CaptureOnLowRisk": captureOnLowRisk,
        "VoidOnHighRisk": voidOnHighRisk,
        "TotalOrderAmount": totalOrderAmount,
        "FingerPrintId": fingerPrintId,
        "Browser": browser != null ? browser.toJson() : null,
        "Cart": cart != null ? cart.toJson() : null,
        "MerchantDefinedFields": merchantDefinedFields != null
            ? List<dynamic>.from(merchantDefinedFields.map((x) => x.toJson()))
            : null,
        "Shipping": shipping != null ? shipping.toJson() : null,
        "Travel": travel != null ? travel.toJson() : null,
      };
}
