import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {
  const AppBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Function(BuildContext, ThemeData) builder;

  @override
  AppBuilderState createState() => AppBuilderState();

  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  //
  ThemeData themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initThemeData();
    });
  }

  initThemeData() async {
    // themeData = await ThemeFileUtils.initializeThemeData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, themeData);
  }

  void rebuild() {
    setState(() {});
  }
}
