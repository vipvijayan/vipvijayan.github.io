import 'package:flutter_themer/constants/keys.dart';
import 'package:flutter_themer/exports/exports.dart';

closeScreen() {
  Navigator.pop(navKey.currentContext!);
}

openHome() async {
  Navigator.pushReplacement(navKey.currentContext!, MaterialPageRoute(
    builder: (context) {
      return const HomeScreen();
    },
  ));
}
