import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return DefaultTabController(
      length: state.themeParentModels.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            onTap: (value) {
              state.curSelectedThemeModel = state.themeParentModels[value];
            },
            tabs: state.themeParentModels
                .map((e) => Tab(text: e.title.toUpperCase()))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: state.themeParentModels
              .map((e) => ThemeBuilderTab(themeTab: e))
              .toList(),
        ),
      ),
    );
  }
}
