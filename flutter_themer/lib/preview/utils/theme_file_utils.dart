import 'package:flutter_themer/exports/exports.dart';

class ThemeFileUtils {
  static Future<ThemeData> initializeThemeData(
    Map<String, dynamic> customTheme,
  ) async {
    logD(jsonEncode(customTheme));
    return ThemeData(
      // useMaterial3: true,
      primaryColor: HexColor(customTheme['primary_color']),
      scaffoldBackgroundColor: HexColor(
        customTheme['scaffold_background_color'],
      ),
      appBarTheme: AppBarTheme(
        // color: Colors.red,
        elevation: double.parse(customTheme['app_bar_elevation']),
        backgroundColor: HexColor(
          customTheme['app_bar_background_color'],
        ),
        centerTitle: (customTheme['center_title'] as String).parseBool(),
        iconTheme: IconThemeData(
          color: HexColor(customTheme['app_bar_icon_color']),
          size: double.parse(customTheme['app_bar_icon_size'] as String),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      textTheme: TextTheme(
        // bodyText1: TextStyle(
        //   fontSize: double.parse(
        //     customTheme['text_theme_body_text_1_size'] as String,
        //   ),
        //   color: HexColor(customTheme['text_theme_body_text_1_color']),
        // ),
        // bodyText2: TextStyle(
        //   fontSize: double.parse(
        //     customTheme['text_theme_body_text_2_size'] as String,
        //   ),
        //   color: HexColor(customTheme['text_theme_body_text_2_color']),
        // ),
        bodyLarge: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_body_large_text_size'] as String,
          ),
          color: HexColor(customTheme['text_theme_body_large_text_color']),
        ),
        bodyMedium: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_body_medium_text_size'] as String,
          ),
          color: HexColor(customTheme['text_theme_body_medium_text_color']),
        ),
        bodySmall: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_body_small_text_size'] as String,
          ),
          color: HexColor(customTheme['text_theme_body_small_text_color']),
        ),
        titleLarge: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_title_large_text_size'] as String,
          ),
          color: HexColor(customTheme['text_theme_title_large_text_color']),
        ),
        titleSmall: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_title_small_text_size'] as String,
          ),
          color: HexColor(customTheme['text_theme_title_small_text_color']),
        ),
        titleMedium: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_title_medium_text_size'] as String,
          ),
          color: HexColor(customTheme['text_theme_title_medium_text_color']),
        ),
      ),
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.white,
        onSecondary: Colors.black,
      ),
      cardTheme: CardTheme(
        color: HexColor(customTheme['card_background_color']),
        shadowColor: HexColor(customTheme['card_shadow_color']),
        elevation: double.parse(
          customTheme['card_elevation'] as String,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: HexColor(
          customTheme['tabbar_selected_label_color'],
        ),
        unselectedLabelColor: HexColor(
          customTheme['tabbar_unselected_label_color'],
        ),
        indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: HexColor(
                customTheme['tabbar_indicator_color'],
              ),
              width: double.parse(
                customTheme['tabbar_indicator_width'] as String,
              ),
              style: BorderStyle.solid,
            ),
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
          letterSpacing: 1.1,
          fontSize: 10,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            HexColor(
              customTheme['text_button_foreground_color'],
            ),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: HexColor(
          customTheme['snackbar_background_color'],
        ),
        elevation: double.parse(
          customTheme['snackbar_elevation'] as String,
        ),
        contentTextStyle: TextStyle(
          color: HexColor(
            customTheme['snackbar_text_color'],
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        indent: double.parse(
          customTheme['divider_left_padding'] as String,
        ),
        endIndent: double.parse(
          customTheme['divider_end_padding'] as String,
        ),
        thickness: double.parse(
          customTheme['divider_thickness'] as String,
        ),
        color: HexColor(customTheme['divider_color']),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: HexColor(customTheme['progress_indicator_color']),
        refreshBackgroundColor: HexColor(
          customTheme['refresh_background_color'],
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: HexColor(customTheme['floating_btn_foreground_color']),
        iconSize: double.parse(customTheme['floating_btn_icon_size'] as String),
        backgroundColor: HexColor(customTheme['floating_btn_background_color']),
        enableFeedback:
            (customTheme['floating_btn_enable_feedback'] as String).parseBool(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            HexColor(
              customTheme['elevated_btn_foreground_color'],
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            HexColor(
              customTheme['elevated_btn_background_color'],
            ),
          ),
          elevation: MaterialStateProperty.all<double>(
            double.parse(customTheme['elevated_btn_elevation']),
          ),
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
      for (final uiItem in themeUIModel.items) {
        if (null != customTheme[uiItem.key]) {
          // logD(
          //   'Replacing:: key: ${uiItem.key}, value: ${customTheme[uiItem.key]}',
          // );
          themeHtml = themeHtml.replaceAll(
            "'${uiItem.key}'",
            customTheme[uiItem.key],
          );
        }
      }
    }
    return themeHtml;
  }
}
