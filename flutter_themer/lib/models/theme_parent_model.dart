import 'package:flutter_themer/exports/exports.dart';

class ThemeParentModel {
  final int id;
  final String title;
  ThemeData? curThemeData;
  Brightness brightness;
  List<ThemeUiModel> themeUiModelList;
  ThemeParentModel({
    required this.id,
    required this.title,
    this.themeUiModelList = const [],
    this.curThemeData,
    this.brightness = Brightness.light,
  });
}
