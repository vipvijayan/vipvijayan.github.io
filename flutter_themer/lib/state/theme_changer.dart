import 'package:flutter_themer/utils/exports.dart';

class AppBuilder extends StatefulWidget {
  //
  const AppBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Function(BuildContext) builder;

  @override
  AppBuilderState createState() => AppBuilderState();

  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light().copyWith(
    primary: Colors.greenAccent,
    surface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarHeight: kToolbarHeight + 10,
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    dividerColor: Colors.transparent,
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyColors.light,
  ],
);

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark().copyWith(
    primary: Colors.grey,
    surface: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarHeight: kToolbarHeight + 10,
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    dividerColor: Colors.transparent,
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyColors.dark,
  ],
);
