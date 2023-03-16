import 'package:flutter_themer/utils/exports.dart';

const filesDir = 'assets/files';

Future<List<ThemeUiModel>> loadThemeUIModelList(int themeId) async {
  final json = await rootBundle.loadString(
    '$filesDir/configuration/theme_configuration_$themeId.json',
  );
  final themeModelList = themeUiModelFromJson(json);
  themeModelList.sort((a, b) {
    if (a.excludeSort == null || b.excludeSort == null) {
      return 0;
    }
    final aSort = a.excludeSort ?? false;
    final bSort = b.excludeSort ?? false;
    if (aSort || bSort) {
      return 0;
    }
    return a.title.compareTo(b.title);
  });
  return themeModelList;
}

Future<List<ThemeUiModel>> laodThemeUIList(int themeId) async {
  return compute(loadThemeUIModelList, themeId);
}

Future<String> loadThemeTxt(int themeId) async {
  return rootBundle.loadString(
    '$filesDir/generated/theme_generated_$themeId.html',
  );
}

Future<String> loadCustomColorsTxt() async {
  return rootBundle.loadString('$filesDir/generated/theme_my_colors.html');
}

Future<String> loadUsageHtml() async {
  return rootBundle.loadString('$filesDir/usages/theme_usage.html');
}

Future<String> loadCustomThemeUsage() async {
  return rootBundle.loadString('$filesDir/usages/custom_theme_usage.html');
}

Future<About> loadAboutInfo() async {
  final aboutJson = await rootBundle.loadString('$filesDir/app/about.json');
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
    return jsonDecode(contents) as String;
  } catch (e) {
    return null;
  }
}
