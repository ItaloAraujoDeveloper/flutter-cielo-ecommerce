import 'dart:convert';

import 'package:flutter_cielo_ecommerce/src/Leg.dart';

class Travel {
  DateTime departureTime;
  String journeyType;
  String route;
  List<Leg> legs;

  Travel({
    this.departureTime,
    this.journeyType,
    this.route,
    this.legs,
  });

  factory Travel.fromRawJson(String str) => Travel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        departureTime: DateTime.parse(json["DepartureTime"]),
        journeyType: json["JourneyType"],
        route: json["Route"],
        legs: List<Leg>.from(json["Legs"].map((x) => Leg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DepartureTime": departureTime != null
            ? "${departureTime.year.toString().padLeft(4, '0')}-${departureTime.month.toString().padLeft(2, '0')}-${departureTime.day.toString().padLeft(2, '0')}"
            : null,
        "JourneyType": journeyType,
        "Route": route,
        "Legs": legs != null
            ? List<dynamic>.from(legs.map((x) => x.toJson()))
            : null,
      };
}
