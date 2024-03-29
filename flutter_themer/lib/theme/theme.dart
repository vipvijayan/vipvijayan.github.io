import 'package:flutter_themer/utils/exports.dart';

const fontFamily = 'Roboto_Regular';
var darkBaseTheme = HexColor('#272727');
var lightBaseColor = Colors.white; // HexColor('#2cccd3');
const letterSpacing = 1.0;
const transition = PageTransitionsTheme(builders: {
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
  TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
  TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
});

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: transition,
    splashColor: Colors.green,
    primaryColor: lightBaseColor,
    fontFamily: fontFamily,
    primaryColorDark: lightBaseColor,
    primaryColorLight: const Color.fromARGB(255, 59, 243, 157),
    scaffoldBackgroundColor: lightBaseColor,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    buttonTheme: const ButtonThemeData(
      height: 40,
      buttonColor: Colors.teal,
      disabledColor: Colors.grey,
      focusColor: Colors.tealAccent,
      splashColor: Colors.yellow,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.greenAccent,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: lightBaseColor,
      centerTitle: true,
      toolbarHeight: kToolbarHeight + 30,
      iconTheme: const IconThemeData(
        color: Colors.grey,
        size: 18,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightBaseColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
    ),
    indicatorColor: Colors.teal,
    colorScheme: ColorScheme.light(
      primary: lightBaseColor,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 59, 243, 157)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: lightBaseColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: lightBaseColor),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      dense: false,
      contentPadding: EdgeInsets.all(10),
      horizontalTitleGap: 10,
      iconColor: Colors.blue,
      visualDensity: VisualDensity.comfortable,
    ),
    cardTheme: CardTheme(
        // color: Colors.teal,
        // shadowColor: lightBaseColor,
        ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      // unselectedLabelColor: Colors.black.withOpacity(0.9),
      // labelColor: Colors.blue,
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
      ),

      labelStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
      unselectedLabelStyle: const TextStyle(
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        fontSize: 14,
      ),
    ),
    dividerTheme: const DividerThemeData(
      indent: 15,
      endIndent: 0,
      thickness: 0.1,
      color: Colors.grey,
    ),
    iconTheme: const IconThemeData(
      color: Colors.grey,
      size: 20,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: lightBaseColor,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodySmall: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      titleLarge: const TextStyle(
        color: Colors.grey,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      titleSmall: const TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
        letterSpacing: letterSpacing,
      ),
      titleMedium: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        letterSpacing: letterSpacing,
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    pageTransitionsTheme: transition,
    scaffoldBackgroundColor: HexColor('#222222'),
    splashColor: HexColor('#808088'),
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.white,
    primaryColorDark: HexColor('#808088'),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.greenAccent,
        size: 18,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: HexColor('#20b2aa'),
      elevation: 3,
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      // unselectedLabelColor: HexColor('#DAF7A6'),
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      labelColor: HexColor('#52CC9D'),
      labelStyle: const TextStyle(
        fontSize: 14,
        letterSpacing: 1.1,
        // fontFamily: curFont,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.white30,
        fontSize: 10,
        letterSpacing: 1.1,
        // fontFamily: curFont,
        // fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.black,
      onPrimary: darkBaseTheme,
      secondary: Colors.blue,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.teal,
      refreshBackgroundColor: Colors.green,
    ),
    indicatorColor: Colors.white.withOpacity(0.3),
    cardTheme: CardTheme(
        // color: Colors.black,
        // shadowColor: HexColor('#808088'),
        ),
    dividerTheme: const DividerThemeData(
      indent: 15,
      endIndent: 0,
      thickness: 0.1,
      color: Colors.grey,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 20,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
      size: 20,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.orange,
      backgroundColor: Colors.red,
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodyMedium: TextStyle(
        color: Colors.white.withOpacity(0.90),
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodySmall: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      titleSmall: const TextStyle(
        color: Colors.white70,
        fontSize: 16.0,
        letterSpacing: 1,
      ),
      titleMedium: const TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
        letterSpacing: letterSpacing,
      ),
    ),
  );

  getBtnTextTheme() {
    Brightness brightness =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn) {
      return Colors.white;
    }
    return Colors.white;
  }
}
