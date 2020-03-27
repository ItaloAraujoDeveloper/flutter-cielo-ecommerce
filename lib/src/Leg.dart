import 'dart:convert';

class Leg {
  String destination;
  String origin;

  Leg({
    this.destination,
    this.origin,
  });

  factory Leg.fromRawJson(String str) => Leg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        destination: json["Destination"],
        origin: json["Origin"],
      );

  Map<String, dynamic> toJson() => {
        "Destination": destination,
        "Origin": origin,
      };
}
