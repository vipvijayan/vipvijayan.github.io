import 'package:flutter_themer/exports/exports.dart';

class PreviewAppState extends ChangeNotifier {
  //
  ThemeData curThemeData = ThemeData.light();
  Map<String, dynamic> customTheme = <String, dynamic>{};
  List<ThemeUiModel> themeUIModelList = [];
  String themeGeneratedHtml = '';

  // Device Resolution
  double width = 415;
  double height = 900;

  double tempWidth = 415;
  double tempHeight = 900;

  bool showResolutionInput = false;

  List<CustomColor> customColors = [];

  removeFromCustomColorsList(int id) async {
    for (final c in customColors) {
      if (id == c.id) {
        customColors.remove(c);
      }
    }
  }

  Future<void> init({bool refresh = false, bool darkMode = false}) async {
    customTheme.clear();
    themeUIModelList.clear();
    String jsonData = await loadDefaultThemeValuesFile(darkMode);
    if (customTheme.keys.isEmpty) {
      logD('Custom Theme is Empty. Initializing with Default values');
      customTheme = jsonDecode(jsonData);
    }
    curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
    themeUIModelList = await loadThemeUIModelList();
    if (refresh) {
      notifyListeners();
    }
    if (!refresh) {
      Future.delayed(const Duration(seconds: 1), () async {
        openHome();
      });
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

  refresh() {
    notifyListeners();
  }

  addToTheme(String key, dynamic value) {
    customTheme.addAll({key: value});
  }

  Future<void> generateHtml() async {
    final themeHtml = await ThemeFileUtils.generateThemeTxt(
      customTheme,
      themeUIModelList,
    );
    final customHtml = await ThemeFileUtils.generateCustomThemeTxt(
      customColors,
    );
    themeGeneratedHtml = '<pre>$themeHtml<br /><br />$customHtml';
    notifyListeners();
  }
}

class CustomColor {
  final int id;
  String name;
  String colorCode;
  CustomColor({required this.id, required this.name, required this.colorCode});
}
