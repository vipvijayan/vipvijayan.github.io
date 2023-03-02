import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/pages/about_info.dart';
import 'package:flutter_themer/pages/generated_theme_screen.dart';

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

Future<void> openAboutInfoScreen() async {
  Navigator.push(
    navKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => const AboutInfoScreen(),
    ),
  );
}

closeScreen() {
  Navigator.pop(navKey.currentContext!);
}
