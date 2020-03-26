import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/Customer.dart';
import 'package:flutter_cielo_ecommerce/src/Payment.dart';

class Sale {
  String merchantOrderId;
  Customer customer;
  Payment payment;

  Sale({
    this.merchantOrderId,
    this.customer,
    this.payment,
  });

  factory Sale.fromRawJson(String str) => Sale.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        merchantOrderId: json["MerchantOrderId"] as String,
        customer: Customer.fromJson(json["Customer"]),
        payment: Payment.fromJson(json["Payment"]),
      );

  Map<String, dynamic> toJson() => {
        "MerchantOrderId": merchantOrderId,
        "Customer": customer.toJson(),
        "Payment": payment.toJson(),
      };
}
