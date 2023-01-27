import 'package:flutter_themer/exports/exports.dart';

class PreviewAppState extends ChangeNotifier {
  //
  bool darkTheme = false;
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

  Future<void> init({bool refresh = false}) async {
    themeUIModelList.clear();
    themeUIModelList = await loadThemeUIModelList();
    curThemeData = await ThemeFileUtils.refreshThemeData();
    notifyListeners();
    if (!refresh) openHome();
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
    themeGeneratedHtml = await ThemeFileUtils.generateThemeTxt(
      themeUIModelList,
    );
    customHtml = await ThemeFileUtils.generateCustomThemeTxt(
      customColors,
    );
    themeGeneratedHtml = '$themeGeneratedHtml\n\n';
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
