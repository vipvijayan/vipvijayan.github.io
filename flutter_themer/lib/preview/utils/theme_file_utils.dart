import 'package:flutter_themer/exports/exports.dart';

class ThemeFileUtils {
  static Future<ThemeData> initializeThemeData(
    Map<String, dynamic> customTheme,
  ) async {
    logD(jsonEncode(customTheme));
    return ThemeData(
      // useMaterial3: true,
      primaryColor: HexColor(customTheme['primary_color']['value']),
      scaffoldBackgroundColor: HexColor(
        customTheme['scaffold_background_color']['value'],
      ),
      appBarTheme: AppBarTheme(
        // color: Colors.red,
        elevation: double.parse(customTheme['app_bar_elevation']['value']),
        backgroundColor: HexColor(
          customTheme['app_bar_background_color']['value'],
        ),
        centerTitle:
            (customTheme['center_title']['value'] as String).parseBool(),
        iconTheme: IconThemeData(
          color: HexColor(customTheme['app_bar_icon_color']['value']),
          size:
              double.parse(customTheme['app_bar_icon_size']['value'] as String),
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
            customTheme['text_theme_body_large_text_size']['value'] as String,
          ),
          color: HexColor(
              customTheme['text_theme_body_large_text_color']['value']),
        ),
        bodyMedium: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_body_medium_text_size']['value'] as String,
          ),
          color: HexColor(
              customTheme['text_theme_body_medium_text_color']['value']),
        ),
        bodySmall: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_body_small_text_size']['value'] as String,
          ),
          color: HexColor(
              customTheme['text_theme_body_small_text_color']['value']),
        ),
        titleLarge: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_title_large_text_size']['value'] as String,
          ),
          color: HexColor(
              customTheme['text_theme_title_large_text_color']['value']),
        ),
        titleSmall: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_title_small_text_size']['value'] as String,
          ),
          color: HexColor(
              customTheme['text_theme_title_small_text_color']['value']),
        ),
        titleMedium: TextStyle(
          fontSize: double.parse(
            customTheme['text_theme_title_medium_text_size']['value'] as String,
          ),
          color: HexColor(
              customTheme['text_theme_title_medium_text_color']['value']),
        ),
      ),
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.white,
        onSecondary: Colors.black,
      ),
      cardTheme: CardTheme(
        color: HexColor(customTheme['card_background_color']['value']),
        shadowColor: HexColor(customTheme['card_shadow_color']['value']),
        elevation: double.parse(
          customTheme['card_elevation']['value'] as String,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize:
            tabIndicatorSize(customTheme['tabbar_indicator_size']['selected']),
        labelColor: HexColor(
          customTheme['tabbar_selected_label_color']['value'],
        ),
        unselectedLabelColor: HexColor(
          customTheme['tabbar_unselected_label_color']['value'],
        ),
        indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: HexColor(
                customTheme['tabbar_indicator_color']['value'],
              ),
              width: double.parse(
                customTheme['tabbar_indicator_width']['value'] as String,
              ),
              style: BorderStyle.solid,
            ),
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: double.parse(
            customTheme['tabbar_label_font_size']['value'] as String,
          ),
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 1.1,
          fontSize: double.parse(
            customTheme['tabbar_unselected_label_font_size']['value'] as String,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            HexColor(
              customTheme['text_button_foreground_color']['value'],
            ),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: HexColor(
          customTheme['snackbar_background_color']['value'],
        ),
        elevation: double.parse(
          customTheme['snackbar_elevation']['value'] as String,
        ),
        contentTextStyle: TextStyle(
          color: HexColor(
            customTheme['snackbar_text_color']['value'],
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        indent: double.parse(
          customTheme['divider_left_padding']['value'] as String,
        ),
        endIndent: double.parse(
          customTheme['divider_end_padding']['value'] as String,
        ),
        thickness: double.parse(
          customTheme['divider_thickness']['value'] as String,
        ),
        color: HexColor(customTheme['divider_color']['value']),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: HexColor(customTheme['progress_indicator_color']['value']),
        refreshBackgroundColor: HexColor(
          customTheme['refresh_background_color']['value'],
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor:
            HexColor(customTheme['floating_btn_foreground_color']['value']),
        iconSize: double.parse(
            customTheme['floating_btn_icon_size']['value'] as String),
        backgroundColor:
            HexColor(customTheme['floating_btn_background_color']['value']),
        enableFeedback:
            (customTheme['floating_btn_enable_feedback']['value'] as String)
                .parseBool(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            HexColor(
              customTheme['elevated_btn_foreground_color']['value'],
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            HexColor(
              customTheme['elevated_btn_background_color']['value'],
            ),
          ),
          elevation: MaterialStateProperty.all<double>(
            double.parse(customTheme['elevated_btn_elevation']['value']),
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: HexColor(
          customTheme['drawer_background_color']['value'],
        ),
        elevation:
            double.parse(customTheme['drawer_elevation']['value'] as String),
        width: double.parse(customTheme['drawer_width']['value'] as String),
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
          logD('Type: ${customTheme[uiItem.key]['type']}');
          var val = '';
          if (customTheme[uiItem.key]['type'] == 'dropdown') {
            val = customTheme[uiItem.key]['selected'];
          } else {
            val = customTheme[uiItem.key]['value'];
          }
          themeHtml = themeHtml.replaceAll(
            "'${uiItem.key}'",
            val.replaceAll('#', ''),
          );
        }
      }
    }
    return themeHtml;
  }

  static Future<String> generateCustomThemeTxt(
    List<CustomColor> customColors,
  ) async {
    final length = customColors.length;
    if (0 == length) {
      return '';
    }
    var themeHtml = await loadCustomColorsTxt();
    final newLine = length == 1 ? '' : '\n';
    for (final cColor in customColors) {
      themeHtml = themeHtml.replaceAll(
        'params',
        'required this.${cColor.name},$newLine',
      );
    }
    return themeHtml;
  }
}

tabIndicatorSize(String size) {
  switch (size) {
    case 'TabBarIndicatorSize.label':
      return TabBarIndicatorSize.label;
    default:
      return TabBarIndicatorSize.tab;
  }
}
