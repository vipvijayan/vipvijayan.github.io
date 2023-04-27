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
    required this.icon,
    required this.copyEnabled,
    required this.tooltipMessage,
    this.subtitle = '',
    this.url,
    this.link = false,
  });
  factory AboutItem.fromJson(Map<String, dynamic> json) => AboutItem(
        id: json['id'] as int,
        title: json['title'] as String,
        subtitle: json['subtitle'] == null ? null : json['subtitle'] as String,
        icon: json['icon'] as String,
        link: json['link'] == null ? false : json['link'] as bool,
        url: json['url'] == null ? null : json['url'] as String,
        copyEnabled: json['copy_enabled'] as bool,
        tooltipMessage: json['tooltip_message'] as String,
      );

  final int id;
  final String title;
  final String? subtitle;
  final String icon;
  final String? url;
  final bool copyEnabled;
  final bool? link;
  final String tooltipMessage;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'icon': icon,
        'link': link,
        'url': url,
        'copy_enabled': copyEnabled,
        'tooltip_message': tooltipMessage,
      };
}
