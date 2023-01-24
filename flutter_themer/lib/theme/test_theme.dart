import 'package:flutter_themer/exports/exports.dart';

class TestTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF1B1B1B),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF0645B1),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Color(0xFFFFFFFF),
        size: 20,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 26,
        color: Color(0xFF000000),
      ),
      bodyMedium: TextStyle(
        fontSize: 23,
        color: Color(0xFF000000),
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Color(0xFF000000),
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        color: Color(0xFF000000),
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        color: Color(0xFF000000),
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: Color(0xFF000000),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Color(0xFFF2F2F2),
      labelColor: Color(0xFF000000),
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF000000),
            width: 3,
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
        foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF008080)),
      ),
    ),
    cardTheme: CardTheme(
        color: Color(0xFF008080), shadowColor: Color(0xFFC2C2C2), elevation: 3),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF008080),
      elevation: 3,
      contentTextStyle: TextStyle(
        color: Color(0xFF000000),
      ),
    ),
    dividerTheme: DividerThemeData(
      indent: 20,
      endIndent: 20,
      thickness: 1,
      color: Color(0xFF008080),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xFF008080),
      refreshBackgroundColor: Color(0xFF00FF00),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF000000),
      iconSize: 20,
      backgroundColor: Color(0xFF008080),
      enableFeedback: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF008080),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFFF2F2F2),
        ),
        elevation: MaterialStateProperty.all<double>(
          3,
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xFF008080),
      elevation: 3,
      width: 300,
    ),
  );
}
