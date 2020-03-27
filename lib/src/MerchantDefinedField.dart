import 'dart:convert';

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
