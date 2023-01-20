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
    required this.titleType,
    required this.title,
    required this.key,
    required this.value,
    required this.valueType,
    required this.input,
    required this.type,
  });

  final String titleType;
  final String title;
  final String key;
  final String value;
  final String valueType;
  final String input;
  final String type;

  factory ThemeUiModel.fromJson(Map<String, dynamic> json) => ThemeUiModel(
        titleType: json["title_type"],
        title: json["title"],
        key: json["key"],
        value: json["value"],
        valueType: json["value_type"],
        input: json["input"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title_type": titleType,
        "title": title,
        "key": key,
        "value": value,
        "value_type": valueType,
        "input": input,
        "type": type,
      };
}
