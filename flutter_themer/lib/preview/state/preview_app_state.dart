import 'package:flutter_themer/exports/exports.dart';

class PreviewAppState extends ChangeNotifier {
  //
  ThemeData curThemeData = ThemeData.light();
  Map<String, dynamic> customTheme = <String, dynamic>{};
  List<ThemeUiModel> themeUIModelList = [];
  String themeGeneratedHtml = '';
  double width = 415;
  double height = 900;

  double tempWidth = 415;
  double tempHeight = 900;

  bool showResolutionInput = false;

  init({bool refresh = false, bool darkMode = false}) async {
    customTheme.clear();
    themeUIModelList.clear();
    String jsonData = await loadDefaultThemeValuesFile(darkMode);
    if (customTheme.keys.isEmpty) {
      logD('Custom Theme is Empty. Initializing with Default values');
      customTheme = jsonDecode(jsonData);
    }
    curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
    themeUIModelList = await loadThemeUIModelList();
    if (!refresh) {
      Future.delayed(const Duration(seconds: 1), () async {
        openHome();
      });
    }
    if (refresh) {
      notifyListeners();
    }
  }

  Future<void> setPreviewTheme() async {
    curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
    notifyListeners();
  }

  setDeviceDimens() async {
    width = tempWidth;
    height = tempHeight;
    notifyListeners();
  }

  setResInputShow(bool show) async {
    showResolutionInput = show;
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
