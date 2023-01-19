import 'package:flutter_themer/exports/exports.dart';

var darkBaseTheme = HexColor('#272727');
var lightBaseColor = HexColor('#2cccd3');
const letterSpacing = 1.1;
const transition = PageTransitionsTheme(builders: {
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
});

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: transition,
    splashColor: Colors.green,
    primaryColor: lightBaseColor,
    primaryColorDark: lightBaseColor,
    primaryColorLight: const Color.fromARGB(255, 59, 243, 157),
    scaffoldBackgroundColor: lightBaseColor,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: lightBaseColor,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 18,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightBaseColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    indicatorColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: lightBaseColor,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
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
    cardTheme: CardTheme(
      color: Colors.teal,
      shadowColor: lightBaseColor,
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.white.withOpacity(0.9),
      labelColor: Colors.white,
      indicator: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        letterSpacing: 1.2,
        fontWeight: FontWeight.bold,
        // fontFamily: Fonts.TIMES_NEW_ROMAN,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.white,
        // fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
        // fontFamily: Fonts.TIMES_NEW_ROMAN,
        fontSize: 10,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: lightBaseColor,
      elevation: 3,
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    dividerTheme: DividerThemeData(
      indent: 20,
      endIndent: 25,
      thickness: 0.1,
      color: Colors.grey,
    ),
    iconTheme: IconThemeData(
      color: Colors.white70,
      size: 20,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: lightBaseColor,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      titleSmall: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
        letterSpacing: letterSpacing,
      ),
      titleMedium: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
        letterSpacing: letterSpacing,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    pageTransitionsTheme: transition,
    scaffoldBackgroundColor: HexColor('#222222'),
    splashColor: HexColor('#808088'),
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.white,
    primaryColorDark: HexColor('#808088'),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: HexColor('#222222'),
      iconTheme: IconThemeData(
        color: Colors.green,
        size: 18,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.black,
    ), //HexColor('#20b2aa')
    snackBarTheme: SnackBarThemeData(
      backgroundColor: HexColor('#20b2aa'),
      elevation: 3,
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      // unselectedLabelColor: HexColor('#DAF7A6'),
      indicator: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      labelColor: HexColor('#52CC9D'),
      labelStyle: TextStyle(
        fontSize: 14,
        letterSpacing: 1.1,
        // fontFamily: curFont,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
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
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.teal,
    ),
    indicatorColor: Colors.white.withOpacity(0.3),
    cardTheme: CardTheme(
      color: Colors.black,
      shadowColor: HexColor('#808088'),
    ),
    dividerTheme: DividerThemeData(
      indent: 40,
      endIndent: 25,
      thickness: 0.1,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 20,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
      size: 20,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.orange,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodyMedium: TextStyle(
        color: Colors.white.withOpacity(0.90),
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        letterSpacing: letterSpacing,
      ),
      titleSmall: TextStyle(
        color: Colors.white70,
        fontSize: 16.0,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
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
