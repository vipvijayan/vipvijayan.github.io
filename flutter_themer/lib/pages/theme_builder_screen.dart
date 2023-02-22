import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return DefaultTabController(
      length: state.themeParentModels.length,
      child: Scaffold(
        appBar: TabBar(
          onTap: (index) {
            state.curSelectedThemeModel = state.themeParentModels[index];
            state.refreshPreview();
          },
          labelColor: Colors.black,
          tabs: state.themeParentModels.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e.title),
              );
            },
          ).toList(),
        ),
        body: TabBarView(
          children: state.themeParentModels.map((e) {
            return ThemeBuilderTab(themeTab: e);
          }).toList(),
        ),
      ),
    );
  }
}
