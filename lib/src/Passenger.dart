import 'dart:convert';

class Passenger {
  String email;
  String identity;
  String name;
  String rating;
  String phone;
  String status;

  Passenger({
    this.email,
    this.identity,
    this.name,
    this.rating,
    this.phone,
    this.status,
  });

  factory Passenger.fromRawJson(String str) =>
      Passenger.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        email: json["Email"],
        identity: json["Identity"],
        name: json["Name"],
        rating: json["Rating"],
        phone: json["Phone"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Identity": identity,
        "Name": name,
        "Rating": rating,
        "Phone": phone,
        "Status": status,
      };
}
