import 'dart:ffi';

import 'package:flutter_cielo_ecommerce/flutter_cielo.dart';
import 'package:flutter_cielo_ecommerce/src/Browser.dart';
import 'package:flutter_cielo_ecommerce/src/FraudAnalysis.dart';
import 'package:flutter_cielo_ecommerce/src/Shipping.dart';
import 'package:flutter_cielo_ecommerce/src/Travel.dart';

class Constants {
  //cielo API
  static const MerchantId = "ee7af7a9-ad4c-48bc-81d5-8e9f99034b30";
  static const MerchantKey = "QIOGHOHUSFPDTQIVHAYMUXBQMCGEANOMEQOJNYYZ";

  //google maps API

}

void main() async {
  final CieloEcommerce cielo = CieloEcommerce(
    environment: Environment.SANDBOX, // ambiente de desenvolvimento
    merchant: Merchant(
      merchantId: Constants.MerchantId,
      merchantKey: Constants.MerchantKey,
    ),
  );

  //saleExample(cielo: cielo);

  try {
    var result = await cielo.cancellationPaymentId(
        paymentId: 'd598f993-02f3-4ebe-9543-26bd4cd78cb8', amount: 100);
    print(result.providerReturnCode);
    print(result.providerReturnMessage);
    print(result.reasonCode);
    print(result.reasonMessage);
    print(result.returnCode);
    print(result.returnMessage);
    print(result.status);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }

  //cardToketizadoExample(cielo: cielo);
  //saleExample(cielo: cielo);
  /**/
}

void consultMerchantOrderIdExample({CieloEcommerce cielo}) async {
  try {
    var result = await cielo.consultMerchantOrderId(merchantOrderId: '123');
    print(result.payments);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}

void consultPaymentByIdExample({CieloEcommerce cielo}) async {
  try {
    var result = await cielo.consultPaymentById(
        paymentId: '986d0b4b-8bf2-4c6b-be5d-c26667c1c502');
    print(result.payment.amount);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}

//function
void cardToketizadoExample({CieloEcommerce cielo}) async {
  CreditCard cart = CreditCard(
    customerName: "italo lopes de araujo",
    cardNumber: "4001786606443146",
    holder: "Teste Holder",
    expirationDate: "11/2021",
    securityCode: '070',
    brand: "Visa",
  );
  print(cart.toJson());

  try {
    var response = await cielo.tokenizeCard(cart);
    print(response.cardToken);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}

void saleExample({CieloEcommerce cielo}) async {
  Sale sale = Sale(
      merchantOrderId: "123",
      customer: Customer(name: "Ana Carolina"),
      payment: Payment(
        type: TypePayment.creditCard,
        amount: 1,
        installments: 1,
        softDescriptor: "Cielo",
        // country: 'BRA',
        //  currency: 'BRL',
        creditCard: CreditCard.token(
          cardToken: "18829a9f-4429-4be5-b734-7162bbbbc875",
          securityCode: "070",
          brand: "VISA",
        ),
        fraudAnalysis: FraudAnalysis(
          provider: 'cybersource',
          sequence: 'AuthorizeFirst',
          sequenceCriteria: 'OnSuccess',
          totalOrderAmount: 100,
          shipping: Shipping(
            addressee: 'Italo Lopes de Araujo',
            method: 'SameDay',
            phone: '5527998904655',
          ),
        ),
      ));

  try {
    var response = await cielo.createSale(sale);
    print(response.toRawJson());
    print(response.payment.paymentId);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}

void cancellationPaymentIdEXAMPLE({CieloEcommerce cielo}) async {
  try {
    var result = await cielo.cancellationPaymentId(
        paymentId: 'd598f993-02f3-4ebe-9543-26bd4cd78cb8', amount: 100);
    print(result.providerReturnCode);
    print(result.providerReturnMessage);
    print(result.reasonCode);
    print(result.reasonMessage);
    print(result.returnCode);
    print(result.returnMessage);
    print(result.status);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}

void consultBinExample({CieloEcommerce cielo}) async {
  try {
    var result = await cielo.consultBin(bin: '420020');
    print(result.provider);
    print(result.cardType);
    print(result.corporateCard);
    print(result.foreignCard);
    print(result.issuer);
    print(result.issuerCode);
    print(result.status);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}
