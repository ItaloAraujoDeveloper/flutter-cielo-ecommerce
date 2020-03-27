import 'dart:convert';

import 'Item.dart';

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
