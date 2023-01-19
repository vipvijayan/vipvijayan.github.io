import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/pages/generated_theme_screen.dart';

closeScreen() {
  Navigator.pop(navKey.currentContext!);
}

openHome() async {
  Navigator.pushReplacement(
    navKey.currentContext!,
    MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ),
  );
}

openThemeGeneratedScreen() async {
  Navigator.push(
    navKey.currentContext!,
    MaterialPageRoute(
      builder: (context) {
        return const GeneratedThemeScreen();
      },
    ),
  );
}
