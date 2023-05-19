import 'package:flutter_themer/utils/exports.dart';

class ThemeAppState extends ChangeNotifier {
  //
  bool curThemeLight = false;
  bool previewLoading = false;
  bool appDarkTheme = false;
  bool showPreviewToolbar = false;
  bool settingsOpen = false;
  String themeGeneratedHtml = '';
  String usageHtml = '';
  String customHtml = '';
  String updatesHtml = '';

  List<CustomColor> customColors = [];
  List<ThemeParentModel> themeParentModels = [
    ThemeParentModel(id: ThemeIDs.primary.value, title: 'Primary'),
    ThemeParentModel(id: ThemeIDs.basic.value, title: 'Basic'),
    ThemeParentModel(id: ThemeIDs.advanced.value, title: 'Advanced'),
  ];

  late ThemeParentModel curSelectedThemeModel;
  int initialTabIndex = 0;
  int curSelectedThemeIndex = 0;
  bool appLoading = false;
  bool codeGenerating = false;

  late TabController tabController;
  Map<String, dynamic> themeUIScrollControllers = {};

  ThemeAppState() {
    init();
    initFB();
    initSettings();
  }

  Future<void> initSettings() async {
    Future.delayed(const Duration(seconds: 2), () async {
      unawaited(initAboutInfo());
      unawaited(initUsageData());
    });
  }

  Future<void> scrollDown() async {
    final scroller = themeUIScrollControllers['${curSelectedThemeModel.id}'];
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
      themeUIScrollControllers['${curSelectedThemeModel.id}'];

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
    tabController.animateTo(initialTabIndex);
    curSelectedThemeModel = themeParentModels[initialTabIndex];
    curSelectedThemeIndex = initialTabIndex;
    showPreviewToolbar = false;
    settingsOpen = false;
    customColors.clear();
    unawaited(init(refresh: true));
  }

  Future<void> togglePreviewSettings() async {
    showPreviewToolbar = !showPreviewToolbar;
    notifyListeners();
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
    notifyListeners();
  }

  Future<void> initUsageData() async {
    usageHtml = await loadUsageHtml();
  }

  ThemeData currentTheme() =>
      curSelectedThemeModel.curThemeData ?? ThemeData.light();

  Future<void> refreshPreview() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 300), () async {
        for (final tTabs in themeParentModels) {
          if (tTabs.id == curSelectedThemeModel.id) {
            tTabs.curThemeData = await refreshThemeData(tTabs, customColors);
          }
        }
        notifyListeners();
      });
    });
  }

  Future<void> refresh() async {
    notifyListeners();
  }

  Future<void> setCodeGenerating(bool loading) async {
    codeGenerating = loading;
    notifyListeners();
  }

  Future<void> generateHtml() async {
    setCodeGenerating(true);
    var lightThemeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      curSelectedThemeModel.themeUiModelList,
      customColors.isNotEmpty,
      themeId: curSelectedThemeModel.id,
      dark: false,
    );
    var darkThemeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      curSelectedThemeModel.themeUiModelList,
      customColors.isNotEmpty,
      themeId: curSelectedThemeModel.id,
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
    setCodeGenerating(false);
  }

  Future<void> showUpdatesHtmlDialog() async {
    updatesHtml = await loadUpdatesInfoHtml();
    unawaited(showUpdatesModalBottomSheet(updatesHtml));
  }

  Future<void> openSettings() async {
    settingsOpen = !settingsOpen;
    notifyListeners();
  }
}
