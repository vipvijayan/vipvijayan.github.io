import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/preview/utils/theme_file_utils.dart';
import 'package:flutter_themer/utils/nav_utils.dart';

class PreviewAppState extends ChangeNotifier {
  //
  ThemeData curThemeData = ThemeData.light();
  Map<String, dynamic> customTheme = <String, dynamic>{};

  init() async {
    String jsonData = await rootBundle.loadString('assets/theme.json');
    Future.delayed(const Duration(seconds: 1), () async {
      if (customTheme.keys.isEmpty) {
        logD('Custom Theme is Empty. Initializing with Default values');
        customTheme = jsonDecode(jsonData);
      }
      curThemeData = await ThemeFileUtils.initializeThemeData(customTheme);
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
