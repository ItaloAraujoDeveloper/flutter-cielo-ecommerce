import 'dart:convert';

class CieloError {
  int code;
  String message;

  CieloError({
    this.code,
    this.message,
  });

  factory CieloError.fromRawJson(String str) =>
      CieloError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CieloError.fromJson(Map<String, dynamic> json) => CieloError(
        code: json["Code"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
      };
}
