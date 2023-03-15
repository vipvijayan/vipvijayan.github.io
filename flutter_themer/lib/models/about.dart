// To parse this JSON data, do
//
//     final about = aboutFromJson(jsonString);

import 'dart:convert';

About aboutFromJson(String str) => About.fromJson(json.decode(str));

String aboutToJson(About data) => json.encode(data.toJson());

class About {
  About({
    required this.items,
  });

  final List<AboutItem> items;

  factory About.fromJson(Map<String, dynamic> json) => About(
        items: List<AboutItem>.from(
            json["items"].map((x) => AboutItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class AboutItem {
  AboutItem({
    required this.id,
    required this.title,
    required this.value,
    required this.icon,
    required this.copyEnabled,
  });
  factory AboutItem.fromJson(Map<String, dynamic> json) => AboutItem(
        id: json['id'] as int,
        title: json['title'] as String,
        value: json['value'] as String,
        icon: json['icon'] as String,
        copyEnabled: json['copy_enabled'] as bool,
      );

  final int id;
  final String title;
  final String value;
  final String icon;
  final bool copyEnabled;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'value': value,
        'icon': icon,
        'copy_enabled': copyEnabled,
      };
}
