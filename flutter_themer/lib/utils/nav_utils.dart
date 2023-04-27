import 'package:flutter_themer/utils/exports.dart';

openHome() async {
  Navigator.pushReplacement(
    mainNavKey.currentContext!,
    MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ),
  );
}

openThemeGeneratedScreen() async {
  Navigator.push(
    mainNavKey.currentContext!,
    MaterialPageRoute(
      builder: (context) {
        return const GeneratedThemeScreen();
      },
    ),
  );
}

Future<void> openAboutInfoScreen() async {
  Navigator.push(
    mainNavKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => const AboutInfoScreen(),
    ),
  );
}

closeScreen() {
  Navigator.pop(mainNavKey.currentContext!);
}
