import 'dart:convert';

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

  factory Shipping.fromJson(Map<String, dynamic> json) {
    print(json["Method"]);

    return Shipping(
      addressee: json["Addressee"],
      method: json["Method"].toString(),
      phone: json["Phone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Addressee": addressee,
        "Method": method,
        "Phone": phone,
      };
}
