import 'package:flutter_themer/exports/exports.dart';

class ThemeFileUtils {
  static Future<ThemeData> refreshThemeData() async {
    final themeMap = getThemeMap();
    logD(jsonEncode(themeMap));
    return ThemeData(
      // useMaterial3: true,
      primaryColor: HexColor(themeMap['primary_color']),
      scaffoldBackgroundColor: HexColor(themeMap['scaffold_background_color']),
      appBarTheme: AppBarTheme(
          // color: Colors.red,
          elevation: double.parse(themeMap['app_bar_elevation']),
          backgroundColor: HexColor(themeMap['scaffold_background_color']),
          centerTitle: themeMap['center_title']
          // iconTheme: IconThemeData(
          //   color: HexColor(customTheme['app_bar_icon_color']['value']),
          //   size:
          //       double.parse(customTheme['app_bar_icon_size']['value'] as String),
          // ),
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //   statusBarColor: Colors.blue,
          //   statusBarIconBrightness: Brightness.dark,
          //   statusBarBrightness: Brightness.dark,
          // ),
          ),
      // textTheme: TextTheme(
      //   // bodyText1: TextStyle(
      //   //   fontSize: double.parse(
      //   //     customTheme['text_theme_body_text_1_size'] as String,
      //   //   ),
      //   //   color: HexColor(customTheme['text_theme_body_text_1_color']),
      //   // ),
      //   // bodyText2: TextStyle(
      //   //   fontSize: double.parse(
      //   //     customTheme['text_theme_body_text_2_size'] as String,
      //   //   ),
      //   //   color: HexColor(customTheme['text_theme_body_text_2_color']),
      //   // ),
      //   bodyLarge: TextStyle(
      //     fontSize: double.parse(
      //       customTheme['text_theme_body_large_text_size']['value'] as String,
      //     ),
      //     color: HexColor(
      //         customTheme['text_theme_body_large_text_color']['value']),
      //   ),
      //   bodyMedium: TextStyle(
      //     fontSize: double.parse(
      //       customTheme['text_theme_body_medium_text_size']['value'] as String,
      //     ),
      //     color: HexColor(
      //         customTheme['text_theme_body_medium_text_color']['value']),
      //   ),
      //   bodySmall: TextStyle(
      //     fontSize: double.parse(
      //       customTheme['text_theme_body_small_text_size']['value'] as String,
      //     ),
      //     color: HexColor(
      //         customTheme['text_theme_body_small_text_color']['value']),
      //   ),
      //   titleLarge: TextStyle(
      //     fontSize: double.parse(
      //       customTheme['text_theme_title_large_text_size']['value'] as String,
      //     ),
      //     color: HexColor(
      //         customTheme['text_theme_title_large_text_color']['value']),
      //   ),
      //   titleSmall: TextStyle(
      //     fontSize: double.parse(
      //       customTheme['text_theme_title_small_text_size']['value'] as String,
      //     ),
      //     color: HexColor(
      //         customTheme['text_theme_title_small_text_color']['value']),
      //   ),
      //   titleMedium: TextStyle(
      //     fontSize: double.parse(
      //       customTheme['text_theme_title_medium_text_size']['value'] as String,
      //     ),
      //     color: HexColor(
      //         customTheme['text_theme_title_medium_text_color']['value']),
      //   ),
      // ),
      // colorScheme: const ColorScheme.dark(
      //   brightness: Brightness.dark,
      //   primary: Colors.white,
      //   onSecondary: Colors.black,
      // ),
      // cardTheme: CardTheme(
      //   color: HexColor(customTheme['card_background_color']['value']),
      //   shadowColor: HexColor(customTheme['card_shadow_color']['value']),
      //   elevation: double.parse(
      //     customTheme['card_elevation']['value'] as String,
      //   ),
      // ),
      tabBarTheme: TabBarTheme(
        indicatorSize: tabIndicatorSize(themeMap['tabbar_indicator_size']),
        // labelColor: HexColor(
        //   customTheme['tabbar_selected_label_color']['value'],
        // ),
        // unselectedLabelColor: HexColor(
        //   customTheme['tabbar_unselected_label_color']['value'],
        // ),
        // indicator: ShapeDecoration(
        //   shape: UnderlineInputBorder(
        //     borderSide: BorderSide(
        //       color: HexColor(
        //         customTheme['tabbar_indicator_color']['value'],
        //       ),
        //       width: double.parse(
        //         customTheme['tabbar_indicator_width']['value'] as String,
        //       ),
        //       style: BorderStyle.solid,
        //     ),
        //   ),
        // ),
        // labelStyle: TextStyle(
        //   color: Colors.white,
        //   fontSize: double.parse(
        //     customTheme['tabbar_label_font_size']['value'] as String,
        //   ),
        //   letterSpacing: 1.2,
        //   fontWeight: FontWeight.bold,
        // ),
        // unselectedLabelStyle: TextStyle(
        //   color: Colors.white,
        //   letterSpacing: 1.1,
        //   fontSize: double.parse(
        //     customTheme['tabbar_unselected_label_font_size']['value'] as String,
        //   ),
        // ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     foregroundColor: MaterialStateProperty.all<Color>(
      //       HexColor(
      //         customTheme['text_button_foreground_color']['value'],
      //       ),
      //     ),
      //   ),
      // ),
      // snackBarTheme: SnackBarThemeData(
      //   backgroundColor: HexColor(
      //     customTheme['snackbar_background_color']['value'],
      //   ),
      //   elevation: double.parse(
      //     customTheme['snackbar_elevation']['value'] as String,
      //   ),
      //   contentTextStyle: TextStyle(
      //     color: HexColor(
      //       customTheme['snackbar_text_color']['value'],
      //     ),
      //   ),
      // ),
      // dividerTheme: DividerThemeData(
      //   indent: double.parse(
      //     customTheme['divider_left_padding']['value'] as String,
      //   ),
      //   endIndent: double.parse(
      //     customTheme['divider_end_padding']['value'] as String,
      //   ),
      //   thickness: double.parse(
      //     customTheme['divider_thickness']['value'] as String,
      //   ),
      //   color: HexColor(customTheme['divider_color']['value']),
      // ),
      // progressIndicatorTheme: ProgressIndicatorThemeData(
      //   color: HexColor(customTheme['progress_indicator_color']['value']),
      //   refreshBackgroundColor: HexColor(
      //     customTheme['refresh_background_color']['value'],
      //   ),
      // ),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //   foregroundColor:
      //       HexColor(customTheme['floating_btn_foreground_color']['value']),
      //   iconSize: double.parse(
      //       customTheme['floating_btn_icon_size']['value'] as String),
      //   backgroundColor:
      //       HexColor(customTheme['floating_btn_background_color']['value']),
      //   enableFeedback:
      //       (customTheme['floating_btn_enable_feedback']['value'] as String)
      //           .parseBool(),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     foregroundColor: MaterialStateProperty.all<Color>(
      //       HexColor(
      //         customTheme['elevated_btn_foreground_color']['value'],
      //       ),
      //     ),
      //     backgroundColor: MaterialStateProperty.all<Color>(
      //       HexColor(
      //         customTheme['elevated_btn_background_color']['value'],
      //       ),
      //     ),
      //     elevation: MaterialStateProperty.all<double>(
      //       double.parse(customTheme['elevated_btn_elevation']['value']),
      //     ),
      //   ),
      // ),
      // drawerTheme: DrawerThemeData(
      //   backgroundColor: HexColor(
      //     customTheme['drawer_background_color']['value'],
      //   ),
      //   elevation:
      //       double.parse(customTheme['drawer_elevation']['value'] as String),
      //   width: double.parse(customTheme['drawer_width']['value'] as String),
      // ),
      // extensions: <ThemeExtension<dynamic>>[
      //   MyColors.light,
      // ],
    );
  }

  static Map<String, dynamic> getThemeMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    for (final themeUIModel in themeUIModelList) {
      final items = themeUIModel.items;
      for (final item in items) {
        final subItems = item.subItems;
        for (final subItem in subItems) {
          if (subItem.input == 'color') {
            map[subItem.key] = Preferences.darkTheme
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'number') {
            map[subItem.key] = Preferences.darkTheme
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'boolean') {
            map[subItem.key] = (Preferences.darkTheme
                    ? subItem.dark.value.first.value
                    : subItem.light.value.first.value)
                .parseBool();
          }
          if (subItem.input == 'dropdown') {
            final list = Preferences.darkTheme
                ? subItem.dark.value
                : subItem.light.value;
            map[subItem.key] = list
                .firstWhere(
                  (element) => element.selected,
                )
                .value;
          }
        }
      }
    }
    return map;
  }

  static Future<String> generateThemeTxt(
    List<ThemeUiModel> themeUIModelList,
  ) async {
    var themeHtml = await loadThemeTxt();
    for (final themeUIModel in themeUIModelList) {
      final items = themeUIModel.items;
      for (final item in items) {
        final subItems = item.subItems;
        for (final subItem in subItems) {
          var val = '';
          if (subItem.input == 'color') {
            val = Preferences.darkTheme
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'number') {
            val = Preferences.darkTheme
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'boolean') {
            val = Preferences.darkTheme
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'dropdown') {
            final list = Preferences.darkTheme
                ? subItem.dark.value
                : subItem.light.value;
            val = list
                .firstWhere(
                  (element) => element.selected,
                )
                .value;
          }
          themeHtml = themeHtml.replaceAll(
            "'${subItem.key}'",
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
    var str999 = '';
    var str888 = '';
    var str777 = '';
    var str666 = '';
    var str555 = '';
    var str444 = '';
    var str333 = '';
    int counter = 0;
    for (final cColor in customColors) {
      if (cColor.name.trim().isEmpty) continue;
      final space = counter == 0 ? '' : '  ';
      str999 += '$space this.${cColor.name},$newLine';
      str888 += '$space final Color? ${cColor.name};$newLine';
      str777 += '$space Color? ${cColor.name},$newLine';
      str666 +=
          '$space ${cColor.name}: ${cColor.name} ?? this.${cColor.name},$newLine';
      counter++;
      str555 +=
          '$space ${cColor.name}: Color.lerp(${cColor.name}, other.${cColor.name},t),$newLine';
      str444 +=
          "$space ${cColor.name}: Color(0x${cColor.lightModeColorCode}),$newLine";
      str333 +=
          "$space ${cColor.name}: Color(0x${cColor.darkModeColorCode}),$newLine";
    }
    themeHtml = themeHtml.replaceAll('9999999999', str999);
    themeHtml = themeHtml.replaceAll('8888888888', str888);
    themeHtml = themeHtml.replaceAll('7777777777', str777);
    themeHtml = themeHtml.replaceAll('6666666666', str666);
    themeHtml = themeHtml.replaceAll('5555555555', str555);
    themeHtml = themeHtml.replaceAll('4444444444', str444);
    themeHtml = themeHtml.replaceAll('3333333333', str333);
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
