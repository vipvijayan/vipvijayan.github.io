import 'package:flutter_themer/exports/exports.dart';

import 'dart:async' show Future;

import 'package:flutter_themer/models/theme_ui_model.dart';

Future<String> loadThemeUIModelFromFile() async {
  return await rootBundle.loadString('assets/theme_configuration.json');
}

Future<List<ThemeUiModel>> loadThemeUIModelList() async {
  String json = await rootBundle.loadString('assets/theme_configuration.json');
  return themeUiModelFromJson(json);
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/$themeFileName');
}

Future<File> saveTheme(Map<String, dynamic> themeMap) async {
  final file = await _localFile;
  return file.writeAsString(jsonEncode(themeMap));
}

Future<String?> readTheme() async {
  try {
    final file = await _localFile;
    final contents = await file.readAsString();
    return jsonDecode(contents);
  } catch (e) {
    return null;
  }
}
