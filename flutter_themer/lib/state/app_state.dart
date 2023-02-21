import 'package:flutter_themer/exports/exports.dart';

class ThemeAppState extends ChangeNotifier {
  //
  bool appDarkTheme = false;
  String themeGeneratedHtml = '';
  String usageHtml = '';
  String customHtml = '';

  List<CustomColor> customColors = [];
  List<ThemeParentModel> themeParentModels = [
    ThemeParentModel(id: ThemeIDs.basic.value, title: 'Primary'),
    ThemeParentModel(id: ThemeIDs.advanced.value, title: 'Custom'),
  ];
  ThemeParentModel? curSelectedThemeModel;

  removeFromCustomColorsList(int id) async {
    final temp = <CustomColor>[];
    temp.addAll(customColors);
    for (final c in temp) {
      if (id == c.id) {
        customColors.remove(c);
      }
    }
  }

  // refresh = true used to reload default configuration after the app started
  Future<void> init({bool refresh = false}) async {
    for (final tTabs in themeParentModels) {
      tTabs.themeUiModelList = await loadThemeUIModelList(tTabs.id);
      tTabs.curThemeData = await refreshThemeData(tTabs, customColors);
    }
    curSelectedThemeModel = themeParentModels.first;
    notifyListeners();
    if (!refresh) openHome();
    initUsageData();
  }

  Future<void> initUsageData() async {
    Future.delayed(const Duration(seconds: 2), () async {
      usageHtml = await laodUsageHtml();
    });
  }

  currentTheme() {
    return curSelectedThemeModel?.curThemeData ?? ThemeData.light();
  }

  Future<void> refreshPreview() async {
    for (final tTabs in themeParentModels) {
      tTabs.curThemeData = await refreshThemeData(tTabs, customColors);
    }
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }

  Future<void> generateHtml() async {
    if (null == curSelectedThemeModel) {
      return;
    }
    String lightThemeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      curSelectedThemeModel!.themeUiModelList,
      customColors.isNotEmpty,
      themeId: curSelectedThemeModel!.id,
      dark: false,
    );
    String darkThemeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      curSelectedThemeModel!.themeUiModelList,
      customColors.isNotEmpty,
      themeId: curSelectedThemeModel!.id,
      dark: true,
    );
    customHtml = await ThemeFileUtils.generateCustomThemeTxt(customColors);

    lightThemeGeneratedHtml =
        "import 'package:flutter/material.dart';\n\nclass AppTheme { \n\n  AppTheme._();\n\n$lightThemeGeneratedHtml";
    darkThemeGeneratedHtml =
        darkThemeGeneratedHtml.replaceAll('lightTheme', 'darkTheme');
    themeGeneratedHtml =
        '$lightThemeGeneratedHtml\n$darkThemeGeneratedHtml\n}\n\n// Usage\n\n$usageHtml';
    if (customColors.isNotEmpty) {
      final customThemeUsage = await loadCustomThemeUsage();
      themeGeneratedHtml =
          '$themeGeneratedHtml\n\n// Custom Colors Usage\n\n$customThemeUsage';
    }
    notifyListeners();
  }
}
