// To parse this JSON data, do
//
//     final themeUiModel = themeUiModelFromJson(jsonString);

import 'dart:convert';

List<ThemeUiModel> themeUiModelFromJson(String str) => List<ThemeUiModel>.from(
    json.decode(str).map((x) => ThemeUiModel.fromJson(x)));

String themeUiModelToJson(List<ThemeUiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThemeUiModel {
  ThemeUiModel({
    required this.id,
    required this.title,
    required this.mainTitle,
    required this.items,
  });

  final int id;
  final String title;
  final bool mainTitle;
  final List<Item> items;

  factory ThemeUiModel.fromJson(Map<String, dynamic> json) => ThemeUiModel(
        id: json["id"],
        title: json["title"],
        mainTitle: json["main_title"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "main_title": mainTitle,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.title,
    required this.key,
    required this.value,
    required this.valueType,
    required this.input,
  });

  final int id;
  final String title;
  final String key;
  final String value;
  final String valueType;
  final String input;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        key: json["key"],
        value: json["value"],
        valueType: json["value_type"],
        input: json["input"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "key": key,
        "value": value,
        "value_type": valueType,
        "input": input,
      };
}
