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
  int currentThemeTabIndex = 0;

  bool showingColorPicker = false;

  Map<String, dynamic> themeUIScrollControllers = {};

  ThemeAppState() {
    init();
  }

  void scrollDown() {
    // logD(themeUIScrollControllers['${curSelectedThemeModel?.id}']);
    final scroller = themeUIScrollControllers['${curSelectedThemeModel?.id}'];
    scroller.animateTo(
      scroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  ScrollController scrollController() {
    return themeUIScrollControllers['${curSelectedThemeModel?.id}'];
  }

  Future<void> removeFromCustomColorsList(int id) async {
    final temp = <CustomColor>[];
    temp.addAll(customColors);
    for (final c in temp) {
      if (id == c.id) {
        customColors.remove(c);
      }
    }
  }

  Future<void> reset() async {
    customColors.clear();
    init(refresh: true);
  }

  // refresh = true used to reload default configuration after the app started
  Future<void> init({bool refresh = false}) async {
    for (final tTabs in themeParentModels) {
      tTabs.themeUiModelList = await loadThemeUIModelList(tTabs.id);
      tTabs.curThemeData = await refreshThemeData(tTabs, customColors);
      themeUIScrollControllers['${tTabs.id}'] = ScrollController();
    }
    curSelectedThemeModel = themeParentModels.first;
    notifyListeners();
    if (!refresh) openHome();
    initUsageData();
  }

  Future<void> initUsageData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      usageHtml = await loadUsageHtml();
    });
  }

  currentTheme() {
    return curSelectedThemeModel?.curThemeData ?? ThemeData.light();
  }

  Future<void> refreshPreview() async {
    for (final tTabs in themeParentModels) {
      if (tTabs.id == currentThemeTabIndex) {
        tTabs.curThemeData = await refreshThemeData(tTabs, customColors);
      }
    }
    notifyListeners();
  }

  Future<void> refresh() async {
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
        '$lightThemeGeneratedHtml\n$darkThemeGeneratedHtml\n}\n\n// Theme Usage\n\n$usageHtml';
    if (customColors.isNotEmpty) {
      final customThemeUsage = await loadCustomThemeUsage();
      themeGeneratedHtml =
          '$themeGeneratedHtml\n\n// Custom Colors Usage\n\n$customThemeUsage';
    }
    notifyListeners();
  }
}
