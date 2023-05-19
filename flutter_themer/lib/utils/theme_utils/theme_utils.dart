import 'package:flutter_themer/utils/exports.dart';
import 'package:flutter_themer/utils/theme_utils/m3_utils.dart';

String? curBasicSeedColor;

Future<ThemeData> refreshThemeData(
  ThemeParentModel themeParentModel,
  List<CustomColor> customColors,
) async {
  final themeMap = ThemeFileUtils.getThemeMap(themeParentModel);
  final dark = isDarkBrightness(themeParentModel);

  // PRIMARY
  if (ThemeIDs.primary.value == themeParentModel.id) {
    if (dark) {
      return ThemeData(
        useMaterial3: themeMap['key_use_material_3'],
        // primarySwatch: buildMaterialColor(themeMap['key_primary_swatch_color']),
        colorSchemeSeed: HexColor(themeMap['color_scheme_seed']),
      );
    }
    return ThemeData(
      useMaterial3: themeMap['key_use_material_3'],
      // primarySwatch: buildMaterialColor(themeMap['key_primary_swatch_color']),
      colorSchemeSeed: HexColor(themeMap['color_scheme_seed']),
    );
  }
  // BASIC
  if (ThemeIDs.basic.value == themeParentModel.id) {
    Map<String, dynamic>? newMap;
    bool hasNewMap = false;
    if (null == curBasicSeedColor) {
      curBasicSeedColor = themeMap['color_scheme_seed'];
    }
    // Not Equal Generate new set
    if (null != curBasicSeedColor &&
        themeMap['color_scheme_seed'] != curBasicSeedColor) {
      curBasicSeedColor = themeMap['color_scheme_seed'];
      newMap = {};
      newMap = await generateColorScheme(HexColor(curBasicSeedColor!));
      logD('NewColorMap: $newMap');
      themeMap['key_cs_primary'] = newMap['key_cs_primary'];
      logD('CurColorMap: $themeMap');

      final dark = isDarkBrightness(themeParentModel);
      for (final themeUIModel in themeParentModel.themeUiModelList) {
        final items = themeUIModel.items;
        for (final item in items) {
          final subItems = item.subItems;
          for (final subItem in subItems) {
            if (subItem.input == 'color') {
              print(subItem.key);
              if (subItem.key != 'color_scheme_seed') {
                if (!dark)
                  subItem.light.value.first.value = newMap[subItem.key];
                if (dark) subItem.dark.value.first.value = newMap[subItem.key];
              }
            }
          }
        }
      }
    }
    hasNewMap = newMap != null;
    final seedColor = HexColor(themeMap['color_scheme_seed']);
    return ThemeData(
      useMaterial3: themeMap['key_use_material_3'],
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: themeParentModel.brightness,
        background: HexColor(themeMap['key_cs_background_color']),
        onBackground: HexColor(themeMap['key_cs_on_background_color']),
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
        onTertiaryContainer: HexColor(themeMap['key_cs_on_tertiary_container']),
        outline: HexColor(themeMap['key_cs_outline']),
      ),
    );
    // return ThemeData(
    //   useMaterial3: themeMap['key_use_material_3'],
    //   brightness: themeParentModel.brightness,
    //   colorScheme: ColorScheme.light(
    //     primary: HexColor(themeMap['key_cs_primary']),
    //     onPrimary: HexColor(themeMap['key_cs_on_primary']),
    //     primaryContainer: HexColor(themeMap['key_cs_primary_container']),
    //     onPrimaryContainer: HexColor(themeMap['key_cs_on_primary_container']),
    //     secondary: HexColor(themeMap['key_cs_secondary']),
    //     onSecondary: HexColor(themeMap['key_cs_on_secondary']),
    //     secondaryContainer: HexColor(themeMap['key_cs_secondary_container']),
    //     onSecondaryContainer:
    //         HexColor(themeMap['key_cs_on_secondary_container']),
    //     surface: HexColor(themeMap['key_cs_surface']),
    //     onSurface: HexColor(themeMap['key_cs_on_surface']),
    //     surfaceTint: HexColor(themeMap['key_cs_surface_tint']),
    //     surfaceVariant: HexColor(themeMap['key_cs_surface_variant']),
    //     onSurfaceVariant: HexColor(themeMap['key_cs_on_surface_variant']),
    //     error: HexColor(themeMap['key_cs_error']),
    //     onError: HexColor(themeMap['key_cs_on_error']),
    //     errorContainer: HexColor(themeMap['key_cs_error_container']),
    //     onErrorContainer: HexColor(themeMap['key_cs_on_error_container']),
    //     tertiary: HexColor(themeMap['key_cs_tertiary']),
    //     onTertiary: HexColor(themeMap['key_cs_on_tertiary']),
    //     tertiaryContainer: HexColor(themeMap['key_cs_tertiary_container']),
    //     onTertiaryContainer: HexColor(themeMap['key_cs_on_tertiary_container']),
    //     outline: HexColor(themeMap['key_cs_outline']),
    //   ),
    // );
  }

  // ADVANCED

  final transition = PageTransitionsTheme(builders: {
    TargetPlatform.android: pageTransitionTheme(
      themeMap['key_page_transitions_android_theme'],
    ),
    TargetPlatform.iOS: pageTransitionTheme(
      themeMap['key_page_transitions_ios_theme'],
    ),
    TargetPlatform.macOS: pageTransitionTheme(
      themeMap['key_page_transitions_mac_os_theme'],
    ),
    TargetPlatform.fuchsia: pageTransitionTheme(
      themeMap['key_page_transitions_fuschia_theme'],
    ),
    TargetPlatform.windows: pageTransitionTheme(
      themeMap['key_page_transitions_windows_theme'],
    ),
    TargetPlatform.linux: pageTransitionTheme(
      themeMap['key_page_transitions_linux_theme'],
    ),
  });

  var colorScheme = _getColorSchemeForAdvanced(themeMap, dark);

  return ThemeData(
    useMaterial3: themeMap['key_use_material_3'],
    pageTransitionsTheme: transition,
    brightness: themeParentModel.brightness,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor(
        themeMap['key_bottom_nav_bar_background_color'],
      ),
      selectedItemColor: HexColor(
        themeMap['key_bottom_nav_bar_selected_item_color'],
      ),
      showSelectedLabels: themeMap['key_bottom_nav_bar_show_selected_labels'],
      showUnselectedLabels:
          themeMap['key_bottom_nav_bar_show_unselected_labels'],
      unselectedItemColor: HexColor(
        themeMap['key_bottom_nav_bar_unselected_item_color'],
      ),
      selectedLabelStyle: TextStyle(
        color: HexColor(
          themeMap['key_bottom_nav_bar_selected_icon_text_color'],
        ),
      ),
      unselectedLabelStyle: TextStyle(
        color: HexColor(
          themeMap['key_bottom_nav_bar_unselected_icon_text_color'],
        ),
      ),
      selectedIconTheme: IconThemeData(
        color: HexColor(
          themeMap['key_bottom_nav_bar_selected_icon_color'],
        ),
        size: double.parse(
          themeMap['key_bottom_nav_bar_selected_icon_size'],
        ),
      ),
      unselectedIconTheme: IconThemeData(
        color: HexColor(
          themeMap['key_bottom_nav_bar_unselected_icon_color'],
        ),
        size: double.parse(
          themeMap['key_bottom_nav_bar_unselected_icon_size'],
        ),
      ),
      elevation: double.parse(themeMap['key_bottom_nav_bar_elevation']),
    ),
    scaffoldBackgroundColor: HexColor(
      themeMap['key_scaffold_background_color'],
    ),
    colorScheme: colorScheme.copyWith(
      brightness: themeParentModel.brightness,
    ),
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint:
          themeMap['key_input_decoration_align_label_with_hint'],
      filled: themeMap['key_input_decoration_filled'],
      floatingLabelAlignment: inputDecFloatingLabelAlignment(
        themeMap['key_input_decoration_floating_label_alignment'],
      ),
      isCollapsed: themeMap['key_input_decoration_collapsed'],
      isDense: themeMap['key_input_decoration_dense'],
      floatingLabelBehavior: inputDecFloatingLabelBehavior(
        themeMap['key_input_decoration_floating_label_behaviour'],
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: systemOverlayStyle(
        themeMap['key_appbar_system_overlay_style'],
      ),
      elevation: double.parse(themeMap['key_app_bar_elevation']),
      backgroundColor: HexColor(themeMap['key_app_bar_background_color']),
      foregroundColor: HexColor(themeMap['key_app_bar_foreground_color']),
      titleSpacing: double.parse(themeMap['key_app_bar_title_spacing']),
      centerTitle: themeMap['key_center_title'],
      toolbarHeight: double.parse(themeMap['key_app_bar_toolbar_height']),
      iconTheme: IconThemeData(
        color: HexColor(themeMap['key_app_bar_icon_color']),
        size: double.parse(themeMap['key_app_bar_icon_size']),
        opacity: double.parse(themeMap['key_app_bar_icon_opacity']),
        fill: double.parse(themeMap['key_app_bar_icon_fill']),
      ),
      actionsIconTheme: IconThemeData(
        color: HexColor(themeMap['key_app_bar_action_icon_color']),
        size: double.parse(themeMap['key_app_bar_action_icon_size']),
        opacity: double.parse(themeMap['key_app_bar_action_icon_opacity']),
        fill: double.parse(themeMap['key_app_bar_action_icon_fill']),
      ),
      titleTextStyle: TextStyle(
        color: HexColor(themeMap['key_app_bar_title_color']),
        fontSize: double.parse(themeMap['key_app_bar_title_font_size']),
        height: double.parse(themeMap['key_app_bar_title_font_height']),
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
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_txt_btn_foreground_color']),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_txt_btn_background_color']),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_txt_btn_overlay_color']),
        ),
        elevation: MaterialStateProperty.all<double>(
          double.parse(themeMap['key_txt_btn_elevation']),
        ),
        iconSize: MaterialStateProperty.all<double>(
          double.parse(themeMap['key_txt_btn_icon_size']),
        ),
        iconColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_txt_btn_icon_color']),
        ),
        alignment: textButtonAlignment(
          themeMap['key_txt_btn_alignment'],
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
        backgroundColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_icon_btn_icon_background_color']),
        ),
        iconColor: MaterialStateProperty.all<Color>(
          HexColor(themeMap['key_icon_btn_icon_color']),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: HexColor(themeMap['key_icon_theme_icon_color']),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: HexColor(themeMap['key_date_picker_background_color']),
      headerBackgroundColor: HexColor(
        themeMap['key_date_picker_header_background_color'],
      ),
      rangePickerBackgroundColor: HexColor(
        themeMap['key_date_picker_range_picker_background_color'],
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(
        HexColor(themeMap['key_radio_theme_fill_color']),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        HexColor(themeMap['key_radio_theme_overlay_color']),
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
      selectedTileColor: HexColor(themeMap['key_list_tile_selected_color']),
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
    badgeTheme: BadgeThemeData(
      backgroundColor: HexColor(
        themeMap['key_bagde_background_color'],
      ),
      textColor: HexColor(
        themeMap['key_bagde_text_color'],
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
    unselectedWidgetColor: HexColor(themeMap['key_unselected_widget_color']),
    dialogBackgroundColor: HexColor(themeMap['key_dialog_background_color']),
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

ColorScheme _getColorSchemeForAdvanced(
    Map<String, dynamic> themeMap, bool isDarkMode) {
  if (isDarkMode) {
    return ColorScheme.light(
      primary: HexColor(themeMap['key_cs_primary']),
      onPrimary: HexColor(themeMap['key_cs_on_primary']),
      primaryContainer: HexColor(themeMap['key_cs_primary_container']),
      onPrimaryContainer: HexColor(themeMap['key_cs_on_primary_container']),
      secondary: HexColor(themeMap['key_cs_secondary']),
      onSecondary: HexColor(themeMap['key_cs_on_secondary']),
      secondaryContainer: HexColor(themeMap['key_cs_secondary_container']),
      onSecondaryContainer: HexColor(themeMap['key_cs_on_secondary_container']),
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
      onTertiaryContainer: HexColor(themeMap['key_cs_on_tertiary_container']),
      outline: HexColor(themeMap['key_cs_outline']),
    );
  }
  return ColorScheme.dark(
    primary: HexColor(themeMap['key_cs_primary']),
    onPrimary: HexColor(themeMap['key_cs_on_primary']),
    primaryContainer: HexColor(themeMap['key_cs_primary_container']),
    onPrimaryContainer: HexColor(themeMap['key_cs_on_primary_container']),
    secondary: HexColor(themeMap['key_cs_secondary']),
    onSecondary: HexColor(themeMap['key_cs_on_secondary']),
    secondaryContainer: HexColor(themeMap['key_cs_secondary_container']),
    onSecondaryContainer: HexColor(themeMap['key_cs_on_secondary_container']),
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
    onTertiaryContainer: HexColor(themeMap['key_cs_on_tertiary_container']),
    outline: HexColor(themeMap['key_cs_outline']),
  );
}
