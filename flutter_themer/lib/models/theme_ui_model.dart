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
    required this.items,
    this.expanded = false,
  });

  final int id;
  final String title;
  bool expanded;
  final List<Item> items;

  factory ThemeUiModel.fromJson(Map<String, dynamic> json) => ThemeUiModel(
        id: json["id"],
        title: json["title"],
        expanded: json["expanded"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "expanded": expanded,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.title,
    required this.subItems,
  });

  final String title;
  final List<SubItem> subItems;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        subItems: List<SubItem>.from(
            json["sub_items"].map((x) => SubItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sub_items": List<dynamic>.from(subItems.map((x) => x.toJson())),
      };
}

class SubItem {
  SubItem({
    required this.id,
    required this.subtitle,
    required this.title,
    required this.key,
    required this.valueType,
    required this.input,
    required this.dark,
    required this.light,
  });

  final int id;
  final bool subtitle;
  final String title;
  final String key;
  final String valueType;
  final String input;
  final Dark dark;
  final Dark light;

  factory SubItem.fromJson(Map<String, dynamic> json) => SubItem(
        id: json["id"],
        subtitle: json["subtitle"],
        title: json["title"],
        key: json["key"],
        valueType: json["value_type"],
        input: json["input"],
        dark: Dark.fromJson(json["dark"]),
        light: Dark.fromJson(json["light"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subtitle": subtitle,
        "title": title,
        "key": key,
        "value_type": valueType,
        "input": input,
        "dark": dark.toJson(),
        "light": light.toJson(),
      };
}

class Dark {
  Dark({
    required this.id,
    required this.value,
  });

  final int id;
  final List<Value> value;

  factory Dark.fromJson(Map<String, dynamic> json) => Dark(
        id: json["id"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    required this.id,
    required this.label,
    this.selected = true,
    required this.value,
    required this.selectedValue,
  });

  final int id;
  final String label;
  bool selected;
  String value;
  String selectedValue;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        label: json["label"],
        selected: json["selected"],
        value: json["value"],
        selectedValue: json["selected_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "selected": selected,
        "value": value,
        "selected_value": selectedValue,
      };
}
