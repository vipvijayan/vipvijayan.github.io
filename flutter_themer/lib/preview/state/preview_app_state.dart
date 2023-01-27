import 'package:flutter_themer/exports/exports.dart';

class PreviewAppState extends ChangeNotifier {
  //
  ThemeData curThemeData = ThemeData.light();
  // Map<String, dynamic> customTheme = <String, dynamic>{};

  String themeGeneratedHtml = '';
  String customHtml = '';

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
    // customTheme.clear();
    themeUIModelList.clear();
    themeUIModelList = await loadThemeUIModelList();
    curThemeData = await ThemeFileUtils.refreshThemeData();
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
    curThemeData = await ThemeFileUtils.refreshThemeData();
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
    // customTheme.addAll({key: value});
  }

  Future<void> generateHtml() async {
    // themeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
    //   customTheme,
    //   themeUIModelList,
    // );
    // customHtml = await ThemeFileUtils.generateCustomThemeTxt(
    //   customColors,
    // );
    // // themeGeneratedHtml = '<pre>$themeHtml<br /><br />$customHtml';
    // themeGeneratedHtml = '$themeGeneratedHtml\n\n';
    // notifyListeners();
  }
}

class CustomColor {
  final int id;
  String name;
  String colorCode;
  CustomColor({required this.id, required this.name, required this.colorCode});
}
