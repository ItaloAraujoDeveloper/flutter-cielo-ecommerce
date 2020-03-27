import 'dart:convert';

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
