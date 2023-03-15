import 'package:flutter_themer/utils/exports.dart';

class ThemeAppState extends ChangeNotifier {
  //
  bool appDarkTheme = false;
  String themeGeneratedHtml = '';
  String usageHtml = '';
  String customHtml = '';

  List<CustomColor> customColors = [];
  List<ThemeParentModel> themeParentModels = [
    ThemeParentModel(id: ThemeIDs.primary.value, title: 'Primary'),
    ThemeParentModel(id: ThemeIDs.basic.value, title: 'Basic'),
    ThemeParentModel(id: ThemeIDs.advanced.value, title: 'Custom'),
  ];

  ThemeParentModel? curSelectedThemeModel;
  bool appLoading = false;

  Map<String, dynamic> themeUIScrollControllers = {};

  ThemeAppState() {
    init();
    initFB();
    initSettings();
  }

  Future<void> initSettings() async {
    packageInfo = await PackageInfo.fromPlatform();
    about = await loadAboutInfo();
    about.items.add(
      AboutItem(
        id: 99,
        title: 'Version',
        value: packageInfo.version,
        icon: '0xe33c',
        copyEnabled: false,
      ),
    );
    unawaited(initUsageData());
  }

  Future<void> initFB() async {
    await analytics.logAppOpen();
    await analytics.setAnalyticsCollectionEnabled(true);
  }

  Future<void> scrollDown() async {
    final scroller = themeUIScrollControllers['${curSelectedThemeModel?.id}'];
    if (null == scroller) {
      logD('Scroller is Null');
      return;
    }
    scroller.animateTo(
      scroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  ScrollController? scrollController() =>
      themeUIScrollControllers['${curSelectedThemeModel?.id}'];

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
    unawaited(init(refresh: true));
  }

  Future<void> setAppLoading(bool loading) async {
    appLoading = loading;
    notifyListeners();
  }

  // refresh = true used to reload default configuration after the app started
  Future<void> init({bool refresh = false}) async {
    unawaited(setAppLoading(true));
    for (final tTabs in themeParentModels) {
      tTabs
        ..themeUiModelList = await loadThemeUIModelList(tTabs.id)
        ..curThemeData = await refreshThemeData(tTabs, customColors);
      themeUIScrollControllers['${tTabs.id}'] = ScrollController();
    }
    curSelectedThemeModel = themeParentModels.first;
    unawaited(setAppLoading(false));
    if (!refresh) {
      openHome();
      return;
    }
  }

  Future<void> initUsageData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      usageHtml = await loadUsageHtml();
      logD(usageHtml);
    });
  }

  ThemeData currentTheme() =>
      curSelectedThemeModel?.curThemeData ?? ThemeData.light();

  Future<void> refreshPreview() async {
    for (final tTabs in themeParentModels) {
      if (tTabs.id == curSelectedThemeModel?.id) {
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
    var lightThemeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      curSelectedThemeModel!.themeUiModelList,
      customColors.isNotEmpty,
      themeId: curSelectedThemeModel!.id,
      dark: false,
    );
    var darkThemeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
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
