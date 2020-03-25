import 'package:flutter_cielo_ecommerce/flutter_cielo.dart';

class Constants {
  //cielo API
  static const MerchantId = "ee7af7a9-ad4c-48bc-81d5-8e9f99034b30";
  static const MerchantKey = "QIOGHOHUSFPDTQIVHAYMUXBQMCGEANOMEQOJNYYZ";

  //google maps API

}

void main() async {
  //5a9363ca-86be-481c-bbc9-f5ead8e10bf0

  final CieloEcommerce cielo = CieloEcommerce(
    environment: Environment.SANDBOX, // ambiente de desenvolvimento
    merchant: Merchant(
      merchantId: Constants.MerchantId,
      merchantKey: Constants.MerchantKey,
    ),
  );
  //0dadcc4c-bd9f-4f6a-8d53-e5de65445a66  => paymentID

  try {
    var result = cielo.consultPaymentById(
        paymentId: '0dadcc4c-bd9f-4f6a-8d53-e5de65445a66');
    print(result);
  } catch (e) {
    print(e);
  }
}

//function
Future<CreditCard> cardToketizadoExample({CieloEcommerce cielo}) async {
  CreditCard cart = CreditCard(
    customerName: "italo lopes de araujo",
    cardNumber: "4001786608301144",
    holder: "Teste Holder",
    expirationDate: "11/2021",
    securityCode: '345',
    brand: "Visa",
  );
  print(cart.toJson());

  try {
    var response = await cielo.tokenizeCard(cart);
    print(response.expirationDate);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}

void saleExample({CieloEcommerce cielo}) async {
  Sale sale = Sale(
      merchantOrderId: "123",
      customer: Customer(name: "Italo Lopes de Araujo"),
      payment: Payment(
        type: TypePayment.creditCard,
        amount: 100,
        installments: 1,
        softDescriptor: "Cielo",
        // country: 'BRA',
        //  currency: 'BRL',
        creditCard: CreditCard.token(
          cardToken: "c46d9d78-091c-4e01-8ba9-f73ed2d31568",
          securityCode: "345",
          brand: "Visa",
        ),
      ));

  print(sale.toRawJson());

  try {
    var response = await cielo.createSale(sale);
    print(response.payment.paymentId);
  } on CieloException catch (e) {
    print(e.message);
    print(e.errors[0].message);
    print(e.errors[0].code);
  }
}
