import 'package:flutter_themer/exports/exports.dart';

class PreviewAppState extends ChangeNotifier {
  //
  ThemeData curThemeData = ThemeData.light();
  Map<String, dynamic> customTheme = <String, dynamic>{};
  List<ThemeUiModel> themeUIModelList = [];
  String themeGeneratedHtml = '';

  init() async {
    String jsonData = await loadDefaultThemeValuesFile();
    if (customTheme.keys.isEmpty) {
      logD('Custom Theme is Empty. Initializing with Default values');
      customTheme = jsonDecode(jsonData);
    }
    curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
    themeUIModelList = await loadThemeUIModelList();
    Future.delayed(const Duration(seconds: 1), () async {
      openHome();
    });
  }

  Future<void> setPreviewTheme() async {
    curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
    notifyListeners();
  }

  addToTheme(String key, dynamic value) {
    customTheme.addAll({key: value});
  }

  Future<void> generateHtml() async {
    themeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      customTheme,
      themeUIModelList,
    );
    notifyListeners();
  }
}
