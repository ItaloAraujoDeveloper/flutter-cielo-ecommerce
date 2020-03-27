import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/ChargeBack.dart';
import 'package:flutter_cielo_ecommerce/src/CreditCard.dart';
import 'package:flutter_cielo_ecommerce/src/Link.dart';

import 'FraudAnalysis.dart';

class Payment {
  String type;
  int amount;
  int installments;
  String provider;
  String address;
  String boletoNumber;
  String assignor;
  String demonstrative;
  String expirationDate;
  String identification;
  String instructions;
  String softDescriptor;
  CreditCard creditCard;

  String url;
  String number;
  String barCodeNumber;
  String digitableLine;
  String paymentId;
  String currency;
  String country;
  List<dynamic> extraDataCollection;
  int status;
  List<Link> links;

  int serviceTaxAmount;
  dynamic interest;
  bool capture;
  bool authenticate;
  String proofOfSale;
  String tid;
  String authorizationCode;
  String returnCode;
  String returnMessage;

  FraudAnalysis fraudAnalysis;

  Payment({
    this.type,
    this.amount,
    this.provider,
    this.address,
    this.boletoNumber,
    this.assignor,
    this.demonstrative,
    this.expirationDate,
    this.identification,
    this.instructions,
    this.installments,
    this.softDescriptor,
    this.creditCard,
    this.url,
    this.number,
    this.barCodeNumber,
    this.digitableLine,
    this.paymentId,
    this.currency,
    this.country,
    this.extraDataCollection,
    this.status,
    this.links,
    this.serviceTaxAmount,
    this.interest,
    this.capture,
    this.authenticate,
    this.proofOfSale,
    this.tid,
    this.authorizationCode,
    this.returnCode,
    this.returnMessage,
    this.fraudAnalysis,
  });

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        type: json['Type'] as String,
        amount: json['Amount'] as int,
        provider: json['Provider'] as String,
        address: json['Address'] as String,
        boletoNumber: json['BoletoNumber'] as String,
        assignor: json['Assignor'] as String,
        demonstrative: json['Demonstrative'] as String,
        expirationDate: json['ExpirationDate'] as String,
        identification: json['Identification'] as String,
        instructions: json['Instructions'] as String,
        installments: json['Installments'] as int,
        softDescriptor: json['SoftDescriptor'] as String,
        creditCard: json['CreditCard'] == null
            ? null
            : CreditCard.fromJson(json['CreditCard'] as Map<String, dynamic>),
        url: json['Url'] as String,
        number: json['Number'] as String,
        barCodeNumber: json['BarCodeNumber'] as String,
        digitableLine: json['DigitableLine'] as String,
        paymentId: json['PaymentId'] as String,
        currency: json['Currency'] as String,
        country: json['Country'] as String,
        extraDataCollection: json['ExtraDataCollection'] as List,
        status: json['Status'] as int,
        links: (json['Links'] as List)
            ?.map((e) => e == null ? null : Link.fromJson(e))
            ?.toList(),
        serviceTaxAmount: json['ServiceTaxAmount'] as int,
        interest: json['Interest'],
        capture: json['Capture'] as bool,
        authenticate: json['Authenticate'] as bool,
        proofOfSale: json['ProofOfSale'] as String,
        tid: json['Tid'] as String,
        authorizationCode: json['AuthorizationCode'] as String,
        returnCode: json['ReturnCode'] as String,
        returnMessage: json['ReturnMessage'] as String,
        fraudAnalysis: json["FraudAnalysis"] != null
            ? FraudAnalysis.fromJson(json["FraudAnalysis"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'Type': type,
        'Amount': amount,
        'Installments': installments,
        'Provider': provider,
        'Address': address,
        'BoletoNumber': boletoNumber,
        'Assignor': assignor,
        'Demonstrative': demonstrative,
        'ExpirationDate': expirationDate,
        'Identification': identification,
        'Instructions': instructions,
        'SoftDescriptor': softDescriptor,
        'CreditCard': creditCard.toJson(),
        'Url': url,
        'Number': number,
        'BarCodeNumber': barCodeNumber,
        'DigitableLine': digitableLine,
        'PaymentId': paymentId,
        'Currency': currency,
        'Country': country,
        'ExtraDataCollection': extraDataCollection,
        'Status': status,
        'Links': links,
        'ServiceTaxAmount': serviceTaxAmount,
        'Interest': interest,
        'Capture': capture,
        'Authenticate': authenticate,
        'ProofOfSale': proofOfSale,
        'Tid': tid,
        'AuthorizationCode': authorizationCode,
        'ReturnCode': returnCode,
        'ReturnMessage': returnMessage,
        "FraudAnalysis": fraudAnalysis != null ? fraudAnalysis.toJson() : null,
      };
}

class TypePayment {
  static String get creditCard => 'CreditCard';
  static String get boleto => 'Boleto';
}

//{"MerchantOrderId": "123", "Customer": {"Name": "Ana Carolina"}, "Payment": {"ServiceTaxAmount": 0, "Installments": 1, "Interest": 0, "Capture": false, "Authenticate": false, "Recurrent": false, "CreditCard": {"SaveCard": false, "CardToken": "18829a9f-4429-4be5-b734-7162bbbbc875", "Brand": "Visa"}, "Tid": "0326065540927", "SoftDescriptor": "Cielo", "Provider": "Simulado", "FraudAnalysis": {"Status": 4, "StatusDescription": "Aborted", "Sequence": "AuthorizeFirst", "SequenceCriteria": "OnSuccess", "TotalOrderAmount": 100, "TransactionAmount": 0, "Shipping": {"Addressee": "Italo Lopes de Araujo", "Phone": "5527998904655", "Method": 1}, "Provider": "Cybersource", "IsRetryTransaction": false}, "IsQrCode": false, "Amount": 1, "ReceivedDate": "2020-03-26 18:55:40", "Status": 0, "IsSplitted": false, "ReturnMessage": "Timed Out", "ReturnCode": "99", "PaymentId": "baaba67f-2a3c-413e-8b3e-d2673bf5e2e9", "Type": "CreditCard", "Currency": "BRL", "Country": "BRA", "Links": [{"Method": "GET", "Rel": "self", "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/baaba67f-2a3c-413e-8b3e-d2673bf5e2e9"}]}}
