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
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light()
      .copyWith(primary: Colors.greenAccent, background: Colors.white),
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarHeight: kToolbarHeight + 10,
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyColors.light,
  ],
);

final darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark()
      .copyWith(primary: Colors.grey, background: Colors.black),
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarHeight: kToolbarHeight + 10,
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyColors.dark,
  ],
);
