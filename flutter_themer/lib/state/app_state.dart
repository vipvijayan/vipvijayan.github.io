import 'package:flutter_themer/exports/exports.dart';

class ThemeAppState extends ChangeNotifier {
  //
  bool darkTheme = false;

  setTheme(bool isDarkTheme) async {
    darkTheme = isDarkTheme;
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}
