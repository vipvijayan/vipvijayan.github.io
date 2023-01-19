import 'dart:convert';

import 'package:flutter_themer/exports/exports.dart';

Future<ThemeData> initializeThemeData() async {
  String jsonData = await rootBundle.loadString('assets/theme.json');
  Map<String, dynamic> data = jsonDecode(jsonData);
  return ThemeData(
    scaffoldBackgroundColor:
        Color(int.parse(data['scaffold_background_color'])),
    appBarTheme: AppBarTheme(
      color: Color(int.parse(data['primary_color'])),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 24,
        color: Color(int.parse(data['text_color'])),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[],
  );
}
