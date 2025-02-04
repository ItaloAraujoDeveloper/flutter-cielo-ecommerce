import 'package:dio/dio.dart';
import 'package:flutter_cielo_ecommerce/src/Bin.dart';
import 'package:flutter_cielo_ecommerce/src/CieloError.dart';
import 'package:flutter_cielo_ecommerce/src/CieloException.dart';
import 'package:flutter_cielo_ecommerce/src/ConsultPayments.dart';
import 'package:flutter_cielo_ecommerce/src/CreditCard.dart';

import 'package:flutter_cielo_ecommerce/src/Environment.dart';
import 'package:flutter_cielo_ecommerce/src/Merchant.dart';
import 'package:flutter_cielo_ecommerce/src/Sale.dart';

import 'Cancellation.dart';

class CieloEcommerce {
  final Environment environment;
  final Merchant merchant;
  Dio dio;

  CieloEcommerce({this.environment, this.merchant}) {
    dio = Dio(BaseOptions(headers: {
      "MerchantId": this.merchant.merchantId,
      "MerchantKey": this.merchant.merchantKey
    }));
  }

  Future<Sale> createSale(Sale sale) async {
    try {
      Response response =
          await dio.post("${environment.apiUrl}/1/sales/", data: sale.toJson());

      //print(response.data);
      return Sale.fromJson(response.data);
    } on DioError catch (e) {
      _getErrorDio(e);
    } catch (e) {
      throw CieloException(
          List<CieloError>()
            ..add(CieloError(
              code: 0,
              message: e.message,
            )),
          "unknown");
    }
    return null;
  }

  Future<CreditCard> tokenizeCard(CreditCard card) async {
    try {
      Response response =
          await dio.post("${environment.apiUrl}/1/card/", data: card.toJson());
      print(response.request);
      card.cardToken = response.data["CardToken"];
      card.cardNumber =
          "****" + card.cardNumber.substring(card.cardNumber.length - 4);
      return card;
    } on DioError catch (e) {
      _getErrorDio(e);
    } catch (e) {
      throw CieloException(
          List<CieloError>()
            ..add(CieloError(
              code: 0,
              message: e.message,
            )),
          "unknown");
    }
    return null;
  }

  Future<Sale> consultPaymentById({String paymentId}) async {
    try {
      Response response =
          await dio.get("${environment.apiQueryUrl}/1/sales/$paymentId");

      return Sale.fromJson(response.data);
    } on DioError catch (e) {
      _getErrorDio(e);
    } catch (e) {
      throw CieloException(
          List<CieloError>()
            ..add(CieloError(
              code: 0,
              message: e.message,
            )),
          "unknown");
    }
    return null;
  }

  Future<ConsultPayments> consultMerchantOrderId(
      {String merchantOrderId}) async {
    try {
      Response response = await dio.get(
          "${environment.apiQueryUrl}/1/sales?merchantOrderId=$merchantOrderId");

      return ConsultPayments.fromJson(response.data);
    } on DioError catch (e) {
      _getErrorDio(e);
    } catch (e) {
      throw CieloException(
          List<CieloError>()
            ..add(CieloError(
              code: 0,
              message: e.message,
            )),
          "unknown");
    }
    return null;
  }

  Future<Bin> consultBin({String bin}) async {
    try {
      Response response =
          await dio.get("${environment.apiQueryUrl}/1/cardBin/$bin");

      return Bin.fromJson(response.data);
    } on DioError catch (e) {
      _getErrorDio(e);
    } catch (e) {
      throw CieloException(
          List<CieloError>()
            ..add(CieloError(
              code: 0,
              message: e.message,
            )),
          "unknown");
    }
    return null;
  }

  Future<Cancellation> cancellationPaymentId(
      {String paymentId, int amount}) async {
    try {
      Response response = await dio.put(
          "${environment.apiUrl}/1/sales/$paymentId/void?amount=${amount.toString()}");
      print(response.data);
      print('dddd');
      return Cancellation.fromJson(response.data);
    } on DioError catch (e) {
      _getErrorDio(e);
    } catch (e) {
      throw CieloException(
          List<CieloError>()
            ..add(CieloError(
              code: 0,
              message: e.message,
            )),
          "unknown");
    }
    return null;
  }

  _getErrorDio(DioError e) {
    if (e?.response != null) {
      List<CieloError> errors =
          (e.response.data as List).map((i) => CieloError.fromJson(i)).toList();
      throw CieloException(errors, e.message);
    } else {
      throw CieloException(
          List<CieloError>()..add(CieloError(code: 0, message: "unknown")),
          e.message);
    }
  }
}
