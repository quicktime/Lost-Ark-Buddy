// To parse this JSON data, do
//
//     final material = materialFromJson(jsonString);

import 'dart:convert';

String itemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  Items({
    required this.id,
    required this.gameCode,
    required this.name,
    required this.image,
    required this.avgPrice,
    required this.lowPrice,
    required this.recentPrice,
    required this.cheapestRemaining,
    required this.amount,
    required this.rarity,
    required this.category,
    this.subcategory,
    required this.shortHistoric,
    required this.updatedAt,
  });

  String id;
  String gameCode;
  String name;
  String image;
  double avgPrice;
  int lowPrice;
  int recentPrice;
  int cheapestRemaining;
  int amount;
  int rarity;
  Category category;
  Subcategory? subcategory;
  Map<String, double> shortHistoric;
  DateTime updatedAt;

  static List<Items> itemsFromJson(String str) =>
      List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        gameCode: json["gameCode"],
        name: json["name"],
        image: json["image"],
        avgPrice: json["avgPrice"]?.toDouble(),
        lowPrice: json["lowPrice"],
        recentPrice: json["recentPrice"],
        cheapestRemaining: json["cheapestRemaining"],
        amount: json["amount"],
        rarity: json["rarity"],
        category: categoryValues.map[json["category"]]!,
        shortHistoric: Map.from(json["shortHistoric"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gameCode": gameCode,
        "name": name,
        "image": image,
        "avgPrice": avgPrice,
        "lowPrice": lowPrice,
        "recentPrice": recentPrice,
        "cheapestRemaining": cheapestRemaining,
        "amount": amount,
        "rarity": rarity,
        "category": categoryValues.reverse[category],
        "subcategory": subcategoryValues.reverse[subcategory],
        "shortHistoric": Map.from(shortHistoric)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

enum Category { ENHANCEMENT_MATERIAL }

final categoryValues =
    EnumValues({"Enhancement Material": Category.ENHANCEMENT_MATERIAL});

enum Subcategory { HONING_MATERIALS }

final subcategoryValues =
    EnumValues({"Honing Materials": Subcategory.HONING_MATERIALS});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
