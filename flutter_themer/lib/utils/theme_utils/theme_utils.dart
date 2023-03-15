import 'package:flutter_themer/utils/exports.dart';

Future<ThemeData> refreshThemeData(
  ThemeParentModel themeParentModel,
  List<CustomColor> customColors,
) async {
  final themeMap = ThemeFileUtils.getThemeMap(themeParentModel);
  // logD(jsonEncode(themeMap));
  logD('<<<<Refreshing Theme>>>>> : ${themeParentModel.id}');
  final isDarkMode = isDarkBrightness(themeParentModel);
  if (ThemeIDs.primary.value == themeParentModel.id) {
    if (isDarkMode) {
      return ThemeData(
        primarySwatch:
            buildMaterialColor(themeMap['key_primary_swatch_color'] as String),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicator: ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      );
    }
    return ThemeData(
      primarySwatch:
          buildMaterialColor(themeMap['key_primary_swatch_color'] as String),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
  if (ThemeIDs.basic.value == themeParentModel.id) {
    if (isDarkMode) {
      return ThemeData(
        brightness: themeParentModel.brightness,
        colorScheme: ColorScheme.dark(
          primary: HexColor(themeMap['key_cs_primary'] as String),
          onPrimary: HexColor(themeMap['key_cs_on_primary'] as String),
          primaryContainer:
              HexColor(themeMap['key_cs_primary_container'] as String),
          onPrimaryContainer:
              HexColor(themeMap['key_cs_on_primary_container'] as String),
          secondary: HexColor(themeMap['key_cs_secondary'] as String),
          onSecondary: HexColor(themeMap['key_cs_on_secondary'] as String),
          secondaryContainer:
              HexColor(themeMap['key_cs_secondary_container'] as String),
          onSecondaryContainer:
              HexColor(themeMap['key_cs_on_secondary_container'] as String),
          surface: HexColor(themeMap['key_cs_surface'] as String),
          onSurface: HexColor(themeMap['key_cs_on_surface'] as String),
          surfaceTint: HexColor(themeMap['key_cs_surface_tint'] as String),
          surfaceVariant:
              HexColor(themeMap['key_cs_surface_variant'] as String),
          onSurfaceVariant:
              HexColor(themeMap['key_cs_on_surface_variant'] as String),
          error: HexColor(themeMap['key_cs_error'] as String),
          onError: HexColor(themeMap['key_cs_on_error'] as String),
          errorContainer:
              HexColor(themeMap['key_cs_error_container'] as String),
          onErrorContainer:
              HexColor(themeMap['key_cs_on_error_container'] as String),
          tertiary: HexColor(themeMap['key_cs_tertiary'] as String),
          onTertiary: HexColor(themeMap['key_cs_on_tertiary'] as String),
          tertiaryContainer:
              HexColor(themeMap['key_cs_tertiary_container'] as String),
          onTertiaryContainer:
              HexColor(themeMap['key_cs_on_tertiary_container'] as String),
          outline: HexColor(themeMap['key_cs_outline'] as String),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicator: ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: 0.5,
            textBaseline: TextBaseline.alphabetic,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.5,
            textBaseline: TextBaseline.alphabetic,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            letterSpacing: 0.5,
            textBaseline: TextBaseline.alphabetic,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            letterSpacing: 0.5,
            textBaseline: TextBaseline.alphabetic,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: 0.5,
            textBaseline: TextBaseline.alphabetic,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.5,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        // scaffoldBackgroundColor: const Color(0xff000000),
        // secondaryHeaderColor: const Color(0xff000000),
        // shadowColor: const Color(0xff00ff00),
        // splashColor: const Color(0xff00ff00),
      );
    }
    return ThemeData(
      brightness: themeParentModel.brightness,
      colorScheme: ColorScheme.light(
        primary: HexColor(themeMap['key_cs_primary'] as String),
        onPrimary: HexColor(themeMap['key_cs_on_primary'] as String),
        primaryContainer:
            HexColor(themeMap['key_cs_primary_container'] as String),
        onPrimaryContainer:
            HexColor(themeMap['key_cs_on_primary_container'] as String),
        secondary: HexColor(themeMap['key_cs_secondary'] as String),
        onSecondary: HexColor(themeMap['key_cs_on_secondary'] as String),
        secondaryContainer:
            HexColor(themeMap['key_cs_secondary_container'] as String),
        onSecondaryContainer:
            HexColor(themeMap['key_cs_on_secondary_container'] as String),
        surface: HexColor(themeMap['key_cs_surface'] as String),
        onSurface: HexColor(themeMap['key_cs_on_surface'] as String),
        surfaceTint: HexColor(themeMap['key_cs_surface_tint'] as String),
        surfaceVariant: HexColor(themeMap['key_cs_surface_variant'] as String),
        onSurfaceVariant:
            HexColor(themeMap['key_cs_on_surface_variant'] as String),
        error: HexColor(themeMap['key_cs_error'] as String),
        onError: HexColor(themeMap['key_cs_on_error'] as String),
        errorContainer: HexColor(themeMap['key_cs_error_container'] as String),
        onErrorContainer:
            HexColor(themeMap['key_cs_on_error_container'] as String),
        tertiary: HexColor(themeMap['key_cs_tertiary'] as String),
        onTertiary: HexColor(themeMap['key_cs_on_tertiary'] as String),
        tertiaryContainer:
            HexColor(themeMap['key_cs_tertiary_container'] as String),
        onTertiaryContainer:
            HexColor(themeMap['key_cs_on_tertiary_container'] as String),
        outline: HexColor(themeMap['key_cs_outline'] as String),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        alignLabelWithHint: false,
        filled: false,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        isCollapsed: false,
        isDense: false,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      primaryTextTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          inherit: true,
          letterSpacing: 0.5,
          textBaseline: TextBaseline.alphabetic,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          inherit: true,
          letterSpacing: 0.5,
          textBaseline: TextBaseline.alphabetic,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          inherit: true,
          letterSpacing: 0.5,
          textBaseline: TextBaseline.alphabetic,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          inherit: true,
          letterSpacing: 0.5,
          textBaseline: TextBaseline.alphabetic,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          inherit: true,
          letterSpacing: 0.5,
          textBaseline: TextBaseline.alphabetic,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          inherit: true,
          letterSpacing: 0.5,
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xfffdfcff),
      secondaryHeaderColor: const Color(0xffe3f2fd),
      shadowColor: const Color(0xff000000),
      splashColor: const Color(0x66c8c8c8),
    );
  }

  final transition = PageTransitionsTheme(builders: {
    TargetPlatform.android: pageTransitionTheme(
      themeMap['key_page_transitions_android_theme'] as String,
    ),
    TargetPlatform.iOS: pageTransitionTheme(
      themeMap['key_page_transitions_ios_theme'] as String,
    ),
    TargetPlatform.macOS: pageTransitionTheme(
      themeMap['key_page_transitions_mac_os_theme'] as String,
    ),
    TargetPlatform.fuchsia: pageTransitionTheme(
      themeMap['key_page_transitions_fuschia_theme'] as String,
    ),
    TargetPlatform.windows: pageTransitionTheme(
      themeMap['key_page_transitions_windows_theme'] as String,
    ),
    TargetPlatform.linux: pageTransitionTheme(
      themeMap['key_page_transitions_linux_theme'] as String,
    ),
  });

  return ThemeData(
    // useMaterial3: true,
    pageTransitionsTheme: transition,
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
      foregroundColor: HexColor(themeMap['key_app_bar_foreground_color']),
      titleSpacing: double.parse(themeMap['key_app_bar_title_spacing']),
      centerTitle: themeMap['key_center_title'],
      toolbarHeight: double.parse(themeMap['key_app_bar_toolbar_height']),
      iconTheme: IconThemeData(
        color: HexColor(themeMap['key_app_bar_icon_color']),
        size: double.parse(themeMap['key_app_bar_icon_size']),
      ),
      actionsIconTheme: IconThemeData(
        color: HexColor(themeMap['key_app_bar_action_icon_color']),
        size: double.parse(themeMap['key_app_bar_action_icon_size']),
      ),
      titleTextStyle: TextStyle(
        color: HexColor(themeMap['key_app_bar_title_color']),
        fontSize: double.parse(themeMap['key_app_bar_title_font_size']),
      ),
      shadowColor: HexColor(themeMap['key_app_bar_shadow_color']),
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
      labelLarge: TextStyle(
        fontSize: double.parse(themeMap['key_txt_theme_label_large_size']),
        color: HexColor(themeMap['key_txt_theme_label_large_color']),
        letterSpacing: double.parse(
          themeMap['key_txt_theme_label_large_letter_spacing'],
        ),
      ),
      labelMedium: TextStyle(
        fontSize: double.parse(themeMap['key_txt_theme_label_medium_size']),
        color: HexColor(themeMap['key_txt_theme_label_medium_color']),
        letterSpacing: double.parse(
          themeMap['key_txt_theme_label_medium_letter_spacing'],
        ),
      ),
      labelSmall: TextStyle(
        fontSize: double.parse(themeMap['key_txt_theme_label_small_size']),
        color: HexColor(themeMap['key_txt_theme_label_small_color']),
        letterSpacing: double.parse(
          themeMap['key_txt_theme_label_small_letter_spacing'],
        ),
      ),
      displayLarge: TextStyle(
        fontSize: double.parse(themeMap['key_txt_theme_display_large_size']),
        color: HexColor(themeMap['key_txt_theme_display_large_color']),
        letterSpacing: double.parse(
          themeMap['key_txt_theme_display_large_letter_spacing'],
        ),
      ),
      displayMedium: TextStyle(
        fontSize: double.parse(themeMap['key_txt_theme_display_medium_size']),
        color: HexColor(themeMap['key_txt_theme_display_medium_color']),
        letterSpacing: double.parse(
          themeMap['key_txt_theme_display_medium_letter_spacing'],
        ),
      ),
      displaySmall: TextStyle(
        fontSize: double.parse(themeMap['key_txt_theme_display_small_size']),
        color: HexColor(themeMap['key_txt_theme_display_small_color']),
        letterSpacing: double.parse(
          themeMap['key_txt_theme_display_small_letter_spacing'],
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: HexColor(themeMap['key_card_background_color']),
      shadowColor: HexColor(themeMap['key_card_shadow_color']),
      elevation: double.parse(themeMap['key_card_elevation']),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: tabIndicatorSize(themeMap['key_tabbar_indicator_size']),
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
      visualDensity: getVisualDensity(themeMap['key_visual_density']),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: HexColor(themeMap['key_chip_theme_background_color']),
      elevation: double.parse(themeMap['key_chip_theme_elevation']),
      selectedColor: HexColor(
        themeMap['key_chip_theme_selected_background_color'],
      ),
      labelStyle: TextStyle(
        color: HexColor(
          themeMap['key_chip_theme_selected_label_color'],
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all<double>(
          double.parse(themeMap['key_icon_btn_theme_icon_size']),
        ),
        iconColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_icon_btn_icon_color']),
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
      tileColor: HexColor(themeMap['key_list_tile_tile_color']),
      iconColor: HexColor(themeMap['key_list_tile_icon_color']),
      selectedColor: HexColor(themeMap['key_list_tile_selected_color']),
      horizontalTitleGap: double.parse(
        themeMap['key_list_tile_horizontal_title_gap'],
      ),
      dense: themeMap['key_list_tile_dense'],
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
    dialogTheme: DialogTheme(
      backgroundColor: HexColor(themeMap['key_dialog_theme_background_color']),
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
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: HexColor(
          themeMap['key_dropdown_menu_theme_input_decoration_fill_color'],
        ),
        iconColor: HexColor(
          themeMap['key_dropdown_menu_theme_input_decoration_icon_color'],
        ),
        filled: true,
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: HexColor(
        themeMap['key_toggle_buttons_theme_fill_color'],
      ),
      color: HexColor(
        themeMap['key_toggle_buttons_theme_color'],
      ),
      selectedColor: HexColor(
        themeMap['key_toggle_buttons_theme_selected_color'],
      ),
      borderColor: HexColor(
        themeMap['key_toggle_buttons_theme_border_color'],
      ),
      selectedBorderColor: HexColor(
        themeMap['key_toggle_buttons_theme_selected_border_color'],
      ),
      highlightColor: Colors.green,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: HexColor(themeMap['key_floating_btn_foreground_color']),
      iconSize: double.parse(themeMap['key_floating_btn_icon_size']),
      backgroundColor: HexColor(themeMap['key_floating_btn_background_color']),
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
    sliderTheme: SliderThemeData(
      activeTrackColor: HexColor(
        themeMap['key_slider_theme_active_track_color'],
      ),
      inactiveTrackColor: HexColor(
        themeMap['key_slider_theme_inactive_track_color'],
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: HexColor(themeMap['key_bottom_appbar_theme_color']),
      elevation: double.parse(themeMap['key_bottom_appbar_theme_elevation']),
      surfaceTintColor: HexColor(
        themeMap['key_bottom_appbar_theme_surface_tint_color'],
      ),
      height: double.parse(themeMap['key_bottom_appbar_theme_height']),
    ),
    buttonBarTheme: ButtonBarThemeData(
      buttonHeight: double.parse(themeMap['key_btn_bar_theme_btn_height']),
      buttonMinWidth: double.parse(
        themeMap['key_btn_bar_theme_btn_min_width'],
      ),
      buttonAlignedDropdown: themeMap['key_btn_bar_theme_btn_aligned_dropdown'],
    ),
    visualDensity: getVisualDensity(themeMap['key_visual_density']),
    extensions: <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
  );
}

MaterialColor buildMaterialColor(String hexCode) {
  final color = HexColor(hexCode);
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var q = 0; q < strengths.length; q++) {
    final ds = 0.5 - strengths[q];
    swatch[(strengths[q] * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
