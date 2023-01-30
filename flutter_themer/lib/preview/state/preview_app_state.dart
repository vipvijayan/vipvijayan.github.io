import 'package:flutter_themer/exports/exports.dart';

class PreviewAppState extends ChangeNotifier {
  //
  bool darkTheme = false;
  ThemeData curThemeData = ThemeData.light();

  String themeGeneratedHtml = '';
  String usageHtml = '';
  String customHtml = '';

  // Device Resolution
  double width = 415;
  double height = 900;

  double tempWidth = 415;
  double tempHeight = 900;

  bool showResolutionInput = false;

  List<CustomColor> customColors = [];
  List<ThemeTab> themeTabs = [
    const ThemeTab(id: 0, title: 'Basic'),
    const ThemeTab(id: 1, title: 'Advanced'),
  ];

  removeFromCustomColorsList(int id) async {
    for (final c in customColors) {
      if (id == c.id) {
        customColors.remove(c);
      }
    }
  }

  Future<void> init({bool refresh = false}) async {
    themeUIModelList.clear();
    themeUIModelList = await loadThemeUIModelList();
    curThemeData = await ThemeFileUtils.refreshThemeData();
    notifyListeners();
    if (!refresh) openHome();
    initUsageData();
  }

  Future<void> initUsageData() async {
    Future.delayed(const Duration(seconds: 2), () async {
      usageHtml = await laodUsageHtml();
    });
  }

  Future<void> refreshPreview() async {
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

  Future<void> generateHtml() async {
    String lightThemeGeneratedHtml =
        await ThemeFileUtils.generateThemeTxt(themeUIModelList, dark: false);
    String darkThemeGeneratedHtml =
        await ThemeFileUtils.generateThemeTxt(themeUIModelList, dark: true);
    customHtml = await ThemeFileUtils.generateCustomThemeTxt(customColors);
    lightThemeGeneratedHtml =
        "import 'package:flutter/material.dart';\n\nclass AppTheme { \n\n$lightThemeGeneratedHtml";
    darkThemeGeneratedHtml =
        darkThemeGeneratedHtml.replaceAll('lightTheme', 'darkTheme');
    themeGeneratedHtml = '$lightThemeGeneratedHtml\n$darkThemeGeneratedHtml\n}';
    notifyListeners();
  }
}

class CustomColor {
  final int id;
  String name;
  String lightModeColorCode;
  String darkModeColorCode;
  CustomColor({
    required this.id,
    required this.name,
    this.lightModeColorCode = '#FF000000',
    this.darkModeColorCode = '#FFFFFFFF',
  });
}

class ThemeTab {
  final int id;
  final String title;
  const ThemeTab({required this.id, required this.title});
}
