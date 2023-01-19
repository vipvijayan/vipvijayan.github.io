import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/models/theme_ui_model.dart';
import 'package:flutter_themer/preview/utils/file_utils.dart';
import 'package:flutter_themer/utils/nav_utils.dart';

class PreviewAppState extends ChangeNotifier {
  //
  ThemeData curThemeData = ThemeData.light();
  Map<String, dynamic> customTheme = <String, dynamic>{};
  List<ThemeUiModel> themeUIModelList = [];

  init() async {
    String jsonData = await rootBundle.loadString('assets/theme.json');
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

  setPreviewTheme() async {
    curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
    notifyListeners();
  }

  addToTheme(String key, dynamic value) {
    customTheme.addAll({key: value});
  }
}
