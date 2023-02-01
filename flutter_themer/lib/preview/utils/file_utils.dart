import 'package:flutter_themer/exports/exports.dart';

const filesDir = 'assets/files';

Future<String> loadThemeUIModelFromFile() async {
  return await rootBundle.loadString('$filesDir/theme_configuration.json');
}

Future<List<ThemeUiModel>> loadThemeUIModelList(int themeId) async {
  final json = await rootBundle.loadString(
    '$filesDir/theme_configuration_$themeId.json',
  );
  return themeUiModelFromJson(json);
}

Future<String> loadThemeTxt(int themeId) async {
  return await rootBundle.loadString('$filesDir/theme_generated_$themeId.html');
}

Future<String> loadCustomColorsTxt() async {
  return await rootBundle.loadString('$filesDir/theme_my_colors.html');
}

Future<String> laodUsageHtml() async {
  return await rootBundle.loadString('$filesDir/usage.html');
}

Future<String> loadDefaultThemeValuesFile(bool darkeMode) async {
  final fileName =
      darkeMode ? 'theme_default_dark.json' : 'theme_default_light.json';
  logD('Loading file: $fileName');
  return await rootBundle.loadString('$filesDir/$fileName');
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
