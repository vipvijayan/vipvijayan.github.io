import 'dart:developer';

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
        bodyText1: TextStyle(
          fontSize: 24,
          color: HexColor(customTheme['text_theme_body_text_1_color']),
        ),
        bodyText2: TextStyle(
          fontSize: 24,
          color: HexColor(customTheme['text_theme_body_text_2_color']),
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        MyColors.light,
      ],
    );
  }

  static Future<String> generateThemeTxt(
    Map<String, dynamic> customTheme,
    List<ThemeUiModel> themeUIModelList,
  ) async {
    var themeHtml = await loadThemeTxt();
    for (final themeUIModel in themeUIModelList) {
      if (null != customTheme[themeUIModel.key]) {
        log('Replacing:: themeUIModel.key: ${themeUIModel.key}, customTheme[themeUIModel.key]: ${customTheme[themeUIModel.key]}');
        themeHtml = themeHtml.replaceAll(
            "'${themeUIModel.key}'", customTheme[themeUIModel.key]);
      }
    }
    return themeHtml;
  }
}
