import 'package:flutter_themer/exports/exports.dart';

class ThemeFileUtils {
  static Future<ThemeData> refreshThemeData(
    ThemeParentModel themeParentModel,
  ) async {
    final themeMap = getThemeMap(themeParentModel);
    logD(jsonEncode(themeMap));
    if (ThemeIDs.basic.value == themeParentModel.id) {
      if (isDarkBrightness(themeParentModel)) {
        return ThemeData(
          brightness: themeParentModel.brightness,
          colorScheme: ColorScheme.dark(
            primary: HexColor(themeMap['key_cs_primary']),
            onPrimary: HexColor(themeMap['key_cs_on_primary']),
            primaryContainer: HexColor(themeMap['key_cs_primary_container']),
            onPrimaryContainer:
                HexColor(themeMap['key_cs_on_primary_container']),
            secondary: HexColor(themeMap['key_cs_secondary']),
            onSecondary: HexColor(themeMap['key_cs_on_secondary']),
            secondaryContainer:
                HexColor(themeMap['key_cs_secondary_container']),
            onSecondaryContainer:
                HexColor(themeMap['key_cs_on_secondary_container']),
            surface: HexColor(themeMap['key_cs_surface']),
            onSurface: HexColor(themeMap['key_cs_on_surface']),
            surfaceTint: HexColor(themeMap['key_cs_surface_tint']),
            surfaceVariant: HexColor(themeMap['key_cs_surface_variant']),
            onSurfaceVariant: HexColor(themeMap['key_cs_on_surface_variant']),
            error: HexColor(themeMap['key_cs_error']),
            onError: HexColor(themeMap['key_cs_on_error']),
            errorContainer: HexColor(themeMap['key_cs_error_container']),
            onErrorContainer: HexColor(themeMap['key_cs_on_error_container']),
            tertiary: HexColor(themeMap['key_cs_tertiary']),
            onTertiary: HexColor(themeMap['key_cs_on_tertiary']),
            tertiaryContainer: HexColor(themeMap['key_cs_tertiary_container']),
            onTertiaryContainer:
                HexColor(themeMap['key_cs_on_tertiary_container']),
            outline: HexColor(themeMap['key_cs_outline']),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            alignLabelWithHint: false,
            filled: false,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            isCollapsed: false,
            isDense: false,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
          primaryTextTheme: TextTheme(
            bodyLarge: TextStyle(
              color: HexColor(themeMap['key_primary_txt_theme_color']),
              fontSize:
                  double.parse(themeMap['key_primary_txt_theme_font_size']),
            ),
          ),
        );
      }
      return ThemeData(
        brightness: themeParentModel.brightness,
        colorScheme: ColorScheme.light(
          primary: HexColor(themeMap['key_cs_primary']),
          onPrimary: HexColor(themeMap['key_cs_on_primary']),
          primaryContainer: HexColor(themeMap['key_cs_primary_container']),
          onPrimaryContainer: HexColor(themeMap['key_cs_on_primary_container']),
          secondary: HexColor(themeMap['key_cs_secondary']),
          onSecondary: HexColor(themeMap['key_cs_on_secondary']),
          secondaryContainer: HexColor(themeMap['key_cs_secondary_container']),
          onSecondaryContainer:
              HexColor(themeMap['key_cs_on_secondary_container']),
          surface: HexColor(themeMap['key_cs_surface']),
          onSurface: HexColor(themeMap['key_cs_on_surface']),
          surfaceTint: HexColor(themeMap['key_cs_surface_tint']),
          surfaceVariant: HexColor(themeMap['key_cs_surface_variant']),
          onSurfaceVariant: HexColor(themeMap['key_cs_on_surface_variant']),
          error: HexColor(themeMap['key_cs_error']),
          onError: HexColor(themeMap['key_cs_on_error']),
          errorContainer: HexColor(themeMap['key_cs_error_container']),
          onErrorContainer: HexColor(themeMap['key_cs_on_error_container']),
          tertiary: HexColor(themeMap['key_cs_tertiary']),
          onTertiary: HexColor(themeMap['key_cs_on_tertiary']),
          tertiaryContainer: HexColor(themeMap['key_cs_tertiary_container']),
          onTertiaryContainer:
              HexColor(themeMap['key_cs_on_tertiary_container']),
          outline: HexColor(themeMap['key_cs_outline']),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          alignLabelWithHint: false,
          filled: false,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          isCollapsed: false,
          isDense: false,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        primaryTextTheme: TextTheme(
          bodyLarge: TextStyle(
            color: HexColor(themeMap['key_primary_txt_theme_color']),
            fontSize: double.parse(themeMap['key_primary_txt_theme_font_size']),
          ),
        ),
      );
    }

    if (ThemeIDs.advanced.value == themeParentModel.id) {
      return ThemeData(
        // useMaterial3: true,
        brightness: themeParentModel.brightness,
        scaffoldBackgroundColor: HexColor(
          themeMap['key_scaffold_background_color'],
        ),
        inputDecorationTheme: const InputDecorationTheme(
          alignLabelWithHint: false,
          filled: false,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          isCollapsed: false,
          isDense: false,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        appBarTheme: AppBarTheme(
          elevation: double.parse(themeMap['key_app_bar_elevation']),
          backgroundColor: HexColor(themeMap['key_app_bar_background_color']),
          centerTitle: themeMap['key_center_title'],
          iconTheme: IconThemeData(
            color: HexColor(themeMap['key_app_bar_icon_color']),
            size: double.parse(themeMap['key_app_bar_icon_size']),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.blue,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: double.parse(themeMap['key_txt_theme_body_large_size']),
            color: HexColor(themeMap['key_txt_theme_body_large_color']),
            letterSpacing: double.parse(
              themeMap['key_txt_theme_body_large_letter_spacing'],
            ),
          ),
          bodyMedium: TextStyle(
            fontSize: double.parse(themeMap['key_txt_theme_body_medium_size']),
            color: HexColor(themeMap['key_txt_theme_body_medium_color']),
            letterSpacing: double.parse(
              themeMap['key_txt_theme_body_medium_letter_spacing'],
            ),
          ),
          bodySmall: TextStyle(
            fontSize: double.parse(themeMap['key_txt_theme_body_small_size']),
            color: HexColor(themeMap['key_txt_theme_body_small_color']),
            letterSpacing: double.parse(
              themeMap['key_txt_theme_body_small_letter_spacing'],
            ),
          ),
          titleLarge: TextStyle(
            fontSize: double.parse(themeMap['key_txt_theme_title_large_size']),
            color: HexColor(themeMap['key_txt_theme_title_large_color']),
            letterSpacing: double.parse(
              themeMap['key_txt_theme_title_large_letter_spacing'],
            ),
          ),
          titleMedium: TextStyle(
            fontSize: double.parse(themeMap['key_txt_theme_title_medium_size']),
            color: HexColor(themeMap['key_txt_theme_title_medium_color']),
            letterSpacing: double.parse(
              themeMap['key_txt_theme_title_medium_letter_spacing'],
            ),
          ),
          titleSmall: TextStyle(
            fontSize: double.parse(themeMap['key_txt_theme_title_small_size']),
            color: HexColor(themeMap['key_txt_theme_title_small_color']),
            letterSpacing: double.parse(
              themeMap['key_txt_theme_title_small_letter_spacing'],
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: HexColor(themeMap['key_card_background_color']),
          shadowColor: HexColor(themeMap['key_card_shadow_color']),
          elevation: double.parse(themeMap['key_card_elevation']),
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize:
              tabIndicatorSize(themeMap['key_tabbar_indicator_size']),
          labelColor: HexColor(themeMap['key_tabbar_selected_label_color']),
          unselectedLabelColor: HexColor(
            themeMap['key_tabbar_unselected_label_color'],
          ),
          indicator: ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: HexColor(
                  themeMap['key_tabbar_indicator_color'],
                ),
                width: double.parse(
                  themeMap['key_tabbar_indicator_width'],
                ),
                style: tabBarIndicatorUnderlineBorderStyle(
                  themeMap['key_tabbar_indicator_underline_border_style'],
                ),
              ),
            ),
          ),
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              HexColor(
                themeMap['key_txt_btn_foreground_color'],
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              HexColor(
                themeMap['key_txt_btn_background_color'],
              ),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all<Color>(
            HexColor(themeMap['key_checkbox_theme_check_color']),
          ),
          fillColor: MaterialStateProperty.all<Color>(
            HexColor(themeMap['key_checkbox_theme_fill_color']),
          ),
          visualDensity: VisualDensity.comfortable,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: HexColor(
            themeMap['key_chip_theme_background_color'],
          ),
          elevation: double.parse(
            themeMap['key_chip_theme_elevation'],
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all<double>(
              double.parse(themeMap['key_icon_btn_theme_icon_size']),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: HexColor(themeMap['key_icon_theme_icon_color']),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all<Color>(
            HexColor(themeMap['key_radio_theme_fill_color']),
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all<Color>(
            HexColor(themeMap['key_switch_theme_track_color']),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              HexColor(themeMap['key_filled_btn_background_color']),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              HexColor(themeMap['key_filled_btn_foreground_color']),
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: HexColor(themeMap['key_list_tile_title_color']),
          iconColor: HexColor(themeMap['key_list_tile_icon_color']),
          selectedColor: HexColor(themeMap['key_list_tile_selected_color']),
          horizontalTitleGap:
              double.parse(themeMap['key_list_tile_horizontal_title_gap']),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: HexColor(
            themeMap['key_snackbar_background_color'],
          ),
          elevation: double.parse(
            themeMap['key_snackbar_elevation'],
          ),
          contentTextStyle: TextStyle(
            color: HexColor(
              themeMap['key_snackbar_content_txt_color'],
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          indent: double.parse(themeMap['key_divider_indent']),
          endIndent: double.parse(themeMap['key_divider_end_indent']),
          thickness: double.parse(themeMap['key_divider_thickness']),
          color: HexColor(themeMap['key_divider_color']),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: HexColor(themeMap['key_progress_indicator_color']),
          refreshBackgroundColor: HexColor(
            themeMap['key_progress_indicator_refresh_background_color'],
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor:
              HexColor(themeMap['key_floating_btn_foreground_color']),
          iconSize: double.parse(themeMap['key_floating_btn_icon_size']),
          backgroundColor:
              HexColor(themeMap['key_floating_btn_background_color']),
          enableFeedback: themeMap['key_floating_btn_enable_feedback'],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              HexColor(themeMap['key_elevated_btn_foreground_color']),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              HexColor(themeMap['key_elevated_btn_background_color']),
            ),
            elevation: MaterialStateProperty.all<double>(
              double.parse(themeMap['key_elevated_btn_elevation']),
            ),
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: HexColor(themeMap['key_drawer_background_color']),
          elevation: double.parse(themeMap['key_drawer_elevation']),
          width: double.parse(themeMap['key_drawer_width']),
        ),
        // extensions: <ThemeExtension<dynamic>>[
        //   MyColors.light,
        // ],
      );
    } else {
      return ThemeData(
        // useMaterial3: true,
        brightness: themeParentModel.brightness,
        // primaryColor: HexColor(themeMap['key_cs_primary_color']),
        // scaffoldBackgroundColor:
        //     HexColor(themeMap['key_scaffold_background_color']),
        // colorScheme: ColorScheme.light(
        //   primary: HexColor(themeMap['key_cs_primary']),
        //   onPrimary: HexColor(themeMap['key_cs_on_primary']),
        //   primaryContainer: HexColor(themeMap['key_cs_primary_container']),
        //   onPrimaryContainer: HexColor(themeMap['key_cs_on_primary_container']),
        //   secondary: HexColor(themeMap['key_cs_secondary']),
        //   onSecondary: HexColor(themeMap['key_cs_on_secondary']),
        //   secondaryContainer: HexColor(themeMap['key_cs_secondary_container']),
        //   onSecondaryContainer:
        //       HexColor(themeMap['key_cs_on_secondary_container']),
        //   surface: HexColor(themeMap['key_cs_surface']),
        //   onSurface: HexColor(themeMap['key_cs_on_surface']),
        //   surfaceTint: HexColor(themeMap['key_cs_surface_tint']),
        //   surfaceVariant: HexColor(themeMap['key_cs_surface_variant']),
        //   onSurfaceVariant: HexColor(themeMap['key_cs_on_surface_variant']),
        //   error: HexColor(themeMap['key_cs_error']),
        //   onError: HexColor(themeMap['key_cs_on_error']),
        //   errorContainer: HexColor(themeMap['key_cs_error_container']),
        //   onErrorContainer: HexColor(themeMap['key_cs_on_error_container']),
        //   brightness: brightness(themeMap['key_cs_brightness']),
        //   tertiary: HexColor(themeMap['key_cs_tertiary']),
        //   onTertiary: HexColor(themeMap['key_cs_on_tertiary']),
        //   tertiaryContainer: HexColor(themeMap['key_cs_tertiary_container']),
        //   onTertiaryContainer: HexColor(themeMap['key_cs_on_tertiary_container']),
        //   outline: HexColor(themeMap['key_cs_cs_outline']),
        //   shadow: HexColor(themeMap['key_cs_shadow']),
        // ),
        appBarTheme: AppBarTheme(
            elevation: double.parse(themeMap['key_app_bar_elevation']),
            backgroundColor: HexColor(themeMap['key_app_bar_background_color']),
            centerTitle: themeMap['key_center_title']
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
          indicatorSize:
              tabIndicatorSize(themeMap['key_tabbar_indicator_size']),
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
  }

  static Map<String, dynamic> getThemeMap(ThemeParentModel themeParentModel) {
    Map<String, dynamic> map = <String, dynamic>{};
    bool dark = isDarkBrightness(themeParentModel);
    for (final themeUIModel in themeParentModel.themeUiModelList) {
      final items = themeUIModel.items;
      for (final item in items) {
        final subItems = item.subItems;
        for (final subItem in subItems) {
          if (subItem.input == 'color') {
            map[subItem.key] = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'number') {
            map[subItem.key] = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'boolean') {
            map[subItem.key] = (dark
                    ? subItem.dark.value.first.value
                    : subItem.light.value.first.value)
                .parseBool();
          }
          if (subItem.input == 'dropdown') {
            final list = dark ? subItem.dark.value : subItem.light.value;
            map[subItem.key] =
                list.firstWhere((element) => element.selected).value;
          }
        }
      }
    }
    return map;
  }

  static Future<String> generateThemeTxt(
    List<ThemeUiModel> themeUIModelList,
    bool hasCustomColors, {
    required int themeId,
    required bool dark,
  }) async {
    var themeHtml = await loadThemeTxt(themeId);
    for (final themeUIModel in themeUIModelList) {
      final items = themeUIModel.items;
      for (final item in items) {
        final subItems = item.subItems;
        for (final subItem in subItems) {
          var val = '';
          if (subItem.input == 'color') {
            val = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
            val = "Color(0x$val)";
          }
          if (subItem.input == 'number') {
            val = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'boolean') {
            val = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'dropdown') {
            final list = dark ? subItem.dark.value : subItem.light.value;
            val = list.firstWhere((element) => element.selected).value;
          }
          themeHtml = themeHtml.replaceAll(
            "'${subItem.key}'",
            val.replaceAll('#', ''),
          );
        }
        themeHtml = themeHtml.replaceAll(
          "'key_cs_brightness",
          brightnessString(!dark),
        );
        if (dark) {
          themeHtml = themeHtml.replaceAll(
            "ColorScheme.light",
            "ColorScheme.dark",
          );
        }
      }
    }
    if (hasCustomColors) {
      if (dark) {
        themeHtml = themeHtml.replaceAll(
          "'extensions'",
          "extensions: <ThemeExtension<dynamic>>[ MyColors.dark ],",
        );
      } else {
        themeHtml = themeHtml.replaceAll(
          "'extensions'",
          "extensions: <ThemeExtension<dynamic>>[ MyColors.light ],",
        );
      }
    } else {
      themeHtml = themeHtml.replaceAll(
        "'extensions'",
        "",
      );
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

tabBarIndicatorUnderlineBorderStyle(String borderStyle) {
  switch (borderStyle) {
    case 'BorderStyle.solid':
      return BorderStyle.solid;
    default:
      return BorderStyle.none;
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

brightnessString(bool bright) {
  return bright ? 'Brightness.light' : 'Brightness.dark';
}

brightness(bool bright) {
  return bright ? Brightness.light : Brightness.dark;
}

bool isDarkBrightness(ThemeParentModel? curSelectedThemeModel) {
  if (null == curSelectedThemeModel) {
    return false;
  }
  return curSelectedThemeModel.brightness == Brightness.dark;
}
