import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String _hasSeenQuickTutorial = 'hasSeenQuickTutorial';

  static Future<bool> hasSeenQuickTutorial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSeenQuickTutorial) ?? false;
  }

  static Future<void> setSeenQuickTutorial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenQuickTutorial, true);
  }
}
