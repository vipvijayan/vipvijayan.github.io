import 'package:flutter_themer/exports/exports.dart';

const filesDir = 'assets/files';

Future<List<ThemeUiModel>> loadThemeUIModelList(int themeId) async {
  final json = await rootBundle.loadString(
    '$filesDir/configuration/theme_configuration_$themeId.json',
  );
  final themeModelList = themeUiModelFromJson(json);
  themeModelList.sort((a, b) {
    if (a.excludeSort || b.excludeSort) {
      return 0;
    }
    return a.title.compareTo(b.title);
  });
  return themeModelList;
}

Future<String> loadThemeTxt(int themeId) async {
  return await rootBundle.loadString(
    '$filesDir/generated/theme_generated_$themeId.html',
  );
}

Future<String> loadCustomColorsTxt() async {
  return await rootBundle
      .loadString('$filesDir/generated/theme_my_colors.html');
}

Future<String> loadUsageHtml() async {
  return await rootBundle.loadString('$filesDir/usages/theme_usage.html');
}

Future<String> loadCustomThemeUsage() async {
  return await rootBundle
      .loadString('$filesDir/usages/custom_theme_usage.html');
}

Future<About> loadAboutInfo() async {
  final aboutJson = await rootBundle.loadString('$filesDir/about.json');
  return aboutFromJson(aboutJson);
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
