// To parse this JSON data, do
//
//     final saleAf = saleAfFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/Address.dart';

class SaleAf {
  String merchantOrderId;
  Customer customer;
  Payment payment;

  SaleAf({
    this.merchantOrderId,
    this.customer,
    this.payment,
  });

  factory SaleAf.fromRawJson(String str) => SaleAf.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaleAf.fromJson(Map<String, dynamic> json) => SaleAf(
        merchantOrderId: json["MerchantOrderId"],
        customer: Customer.fromJson(json["Customer"]),
        payment: Payment.fromJson(json["Payment"]),
      );

  Map<String, dynamic> toJson() => {
        "MerchantOrderId": merchantOrderId,
        "Customer": customer.toJson(),
        "Payment": payment.toJson(),
      };
}

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
        name: json["Name"],
        identity: json["Identity"],
        identityType: json["IdentityType"],
        email: json["Email"],
        birthdate: DateTime.parse(json["Birthdate"]),
        mobile: json["Mobile"],
        phone: json["Phone"],
        address: Address.fromJson(json["Address"]),
        deliveryAddress: Address.fromJson(json["DeliveryAddress"]),
        billingAddress: Address.fromJson(json["BillingAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Identity": identity,
        "IdentityType": identityType,
        "Email": email,
        "Birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "Mobile": mobile,
        "Phone": phone,
        "Address": address.toJson(),
        "DeliveryAddress": deliveryAddress.toJson(),
        "BillingAddress": billingAddress.toJson(),
      };
}

class Payment {
  String type;
  int amount;
  String currency;
  String country;
  int serviceTaxAmount;
  int installments;
  String interest;
  bool capture;
  bool authenticate;
  String softDescriptor;
  CreditCard creditCard;
  FraudAnalysis fraudAnalysis;

  Payment({
    this.type,
    this.amount,
    this.currency,
    this.country,
    this.serviceTaxAmount,
    this.installments,
    this.interest,
    this.capture,
    this.authenticate,
    this.softDescriptor,
    this.creditCard,
    this.fraudAnalysis,
  });

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        type: json["Type"],
        amount: json["Amount"],
        currency: json["Currency"],
        country: json["Country"],
        serviceTaxAmount: json["ServiceTaxAmount"],
        installments: json["Installments"],
        interest: json["Interest"],
        capture: json["Capture"],
        authenticate: json["Authenticate"],
        softDescriptor: json["SoftDescriptor"],
        creditCard: CreditCard.fromJson(json["CreditCard"]),
        fraudAnalysis: FraudAnalysis.fromJson(json["FraudAnalysis"]),
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Amount": amount,
        "Currency": currency,
        "Country": country,
        "ServiceTaxAmount": serviceTaxAmount,
        "Installments": installments,
        "Interest": interest,
        "Capture": capture,
        "Authenticate": authenticate,
        "SoftDescriptor": softDescriptor,
        "CreditCard": creditCard.toJson(),
        "FraudAnalysis": fraudAnalysis.toJson(),
      };
}

class CreditCard {
  String cardNumber;
  String holder;
  String expirationDate;
  String securityCode;
  String brand;
  String saveCard;

  CreditCard({
    this.cardNumber,
    this.holder,
    this.expirationDate,
    this.securityCode,
    this.brand,
    this.saveCard,
  });

  factory CreditCard.fromRawJson(String str) =>
      CreditCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        cardNumber: json["CardNumber"],
        holder: json["Holder"],
        expirationDate: json["ExpirationDate"],
        securityCode: json["SecurityCode"],
        brand: json["Brand"],
        saveCard: json["SaveCard"],
      );

  Map<String, dynamic> toJson() => {
        "CardNumber": cardNumber,
        "Holder": holder,
        "ExpirationDate": expirationDate,
        "SecurityCode": securityCode,
        "Brand": brand,
        "SaveCard": saveCard,
      };
}

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
        browser: Browser.fromJson(json["Browser"]),
        cart: Cart.fromJson(json["Cart"]),
        merchantDefinedFields: List<MerchantDefinedField>.from(
            json["MerchantDefinedFields"]
                .map((x) => MerchantDefinedField.fromJson(x))),
        shipping: Shipping.fromJson(json["Shipping"]),
        travel: Travel.fromJson(json["Travel"]),
      );

  Map<String, dynamic> toJson() => {
        "Provider": provider,
        "Sequence": sequence,
        "SequenceCriteria": sequenceCriteria,
        "CaptureOnLowRisk": captureOnLowRisk,
        "VoidOnHighRisk": voidOnHighRisk,
        "TotalOrderAmount": totalOrderAmount,
        "FingerPrintId": fingerPrintId,
        "Browser": browser.toJson(),
        "Cart": cart.toJson(),
        "MerchantDefinedFields":
            List<dynamic>.from(merchantDefinedFields.map((x) => x.toJson())),
        "Shipping": shipping.toJson(),
        "Travel": travel.toJson(),
      };
}

class Browser {
  bool cookiesAccepted;
  String email;
  String hostName;
  String ipAddress;
  String type;

  Browser({
    this.cookiesAccepted,
    this.email,
    this.hostName,
    this.ipAddress,
    this.type,
  });

  factory Browser.fromRawJson(String str) => Browser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Browser.fromJson(Map<String, dynamic> json) => Browser(
        cookiesAccepted: json["CookiesAccepted"],
        email: json["Email"],
        hostName: json["HostName"],
        ipAddress: json["IpAddress"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "CookiesAccepted": cookiesAccepted,
        "Email": email,
        "HostName": hostName,
        "IpAddress": ipAddress,
        "Type": type,
      };
}

class Cart {
  bool isGift;
  bool returnsAccepted;
  List<Item> items;

  Cart({
    this.isGift,
    this.returnsAccepted,
    this.items,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        isGift: json["IsGift"],
        returnsAccepted: json["ReturnsAccepted"],
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "IsGift": isGift,
        "ReturnsAccepted": returnsAccepted,
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

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

class Passenger {
  String email;
  String identity;
  String name;
  String rating;
  String phone;
  String status;

  Passenger({
    this.email,
    this.identity,
    this.name,
    this.rating,
    this.phone,
    this.status,
  });

  factory Passenger.fromRawJson(String str) =>
      Passenger.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        email: json["Email"],
        identity: json["Identity"],
        name: json["Name"],
        rating: json["Rating"],
        phone: json["Phone"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Identity": identity,
        "Name": name,
        "Rating": rating,
        "Phone": phone,
        "Status": status,
      };
}

class MerchantDefinedField {
  int id;
  String value;

  MerchantDefinedField({
    this.id,
    this.value,
  });

  factory MerchantDefinedField.fromRawJson(String str) =>
      MerchantDefinedField.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MerchantDefinedField.fromJson(Map<String, dynamic> json) =>
      MerchantDefinedField(
        id: json["Id"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Value": value,
      };
}

class Shipping {
  String addressee;
  String method;
  String phone;

  Shipping({
    this.addressee,
    this.method,
    this.phone,
  });

  factory Shipping.fromRawJson(String str) =>
      Shipping.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        addressee: json["Addressee"],
        method: json["Method"],
        phone: json["Phone"],
      );

  Map<String, dynamic> toJson() => {
        "Addressee": addressee,
        "Method": method,
        "Phone": phone,
      };
}

class Travel {
  DateTime departureTime;
  String journeyType;
  String route;
  List<Leg> legs;

  Travel({
    this.departureTime,
    this.journeyType,
    this.route,
    this.legs,
  });

  factory Travel.fromRawJson(String str) => Travel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        departureTime: DateTime.parse(json["DepartureTime"]),
        journeyType: json["JourneyType"],
        route: json["Route"],
        legs: List<Leg>.from(json["Legs"].map((x) => Leg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DepartureTime":
            "${departureTime.year.toString().padLeft(4, '0')}-${departureTime.month.toString().padLeft(2, '0')}-${departureTime.day.toString().padLeft(2, '0')}",
        "JourneyType": journeyType,
        "Route": route,
        "Legs": List<dynamic>.from(legs.map((x) => x.toJson())),
      };
}

class Leg {
  String destination;
  String origin;

  Leg({
    this.destination,
    this.origin,
  });

  factory Leg.fromRawJson(String str) => Leg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        destination: json["Destination"],
        origin: json["Origin"],
      );

  Map<String, dynamic> toJson() => {
        "Destination": destination,
        "Origin": origin,
      };
}
