import 'package:flutter_themer/exports/exports.dart';

class ThemeFileUtils {
  static Future<ThemeData> initializeThemeData(
    Map<String, dynamic> customTheme,
  ) async {
    logD(jsonEncode(customTheme));
    return ThemeData(
      scaffoldBackgroundColor: HexColor(
        customTheme['scaffold_background_color'],
      ),
      appBarTheme: AppBarTheme(
        elevation: double.parse(customTheme['app_bar_elevation']),
        backgroundColor: HexColor(
          customTheme['app_bar_background_color'],
        ),
        centerTitle: (customTheme['center_title'] as String).parseBool(),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 18,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: 24,
          color: HexColor(customTheme['text_color']),
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        MyColors.light,
      ],
    );
  }
}
