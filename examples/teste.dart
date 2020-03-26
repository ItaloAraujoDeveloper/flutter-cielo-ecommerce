import 'package:flutter_cielo_ecommerce/flutter_cielo.dart';

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
/*
  try {
    var result = await cielo.consultMerchantOrderId(merchantOrderId: '123');
    print(result.payments);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }*/

  //cardToketizadoExample(cielo: cielo);
  saleExample(cielo: cielo);
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
Future<CreditCard> cardToketizadoExample({CieloEcommerce cielo}) async {
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
          brand: "Visa",
        ),
      ));

  try {
    var response = await cielo.createSale(sale);
    print(response.toRawJson());
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}
