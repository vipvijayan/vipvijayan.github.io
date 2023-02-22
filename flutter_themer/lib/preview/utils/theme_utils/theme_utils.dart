import 'package:flutter_themer/exports/exports.dart';

Future<ThemeData> refreshThemeData(
  ThemeParentModel themeParentModel,
  List<CustomColor> customColors,
) async {
  final themeMap = ThemeFileUtils.getThemeMap(themeParentModel);
  logD(jsonEncode(themeMap));
  if (ThemeIDs.basic.value == themeParentModel.id) {
    if (isDarkBrightness(themeParentModel)) {
      return ThemeData(
        brightness: themeParentModel.brightness,
        colorScheme: ColorScheme.dark(
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
        // scaffoldBackgroundColor: const Color(0xff000000),
        // secondaryHeaderColor: const Color(0xff000000),
        // shadowColor: const Color(0xff00ff00),
        // splashColor: const Color(0xff00ff00),
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
        onTertiaryContainer: HexColor(themeMap['key_cs_on_tertiary_container']),
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
        visualDensity: VisualDensity.comfortable,
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
      dialogTheme: DialogTheme(
        backgroundColor:
            HexColor(themeMap['key_dialog_theme_background_color']),
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
        buttonAlignedDropdown:
            themeMap['key_btn_bar_theme_btn_aligned_dropdown'],
      ),
      extensions: <ThemeExtension<dynamic>>[
        MyColors.light,
      ],
    );
  } else {
    return ThemeData(
      // useMaterial3: true,
      brightness: themeParentModel.brightness,
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
        indicatorSize: tabIndicatorSize(themeMap['key_tabbar_indicator_size']),
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
