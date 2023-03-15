import 'package:flutter_themer/utils/exports.dart';

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
          onTap: (index) async {
            state.curSelectedThemeModel = state.themeParentModels[index];
            state.refresh();
            fbLogEvent(name: 'Selected: ${state.curSelectedThemeModel?.title}');
          },
          labelColor: Colors.black,
          tabs: state.themeParentModels.map((e) => _tabTitle(e.title)).toList(),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: state.themeParentModels.map((e) {
            return ThemeBuilderTab(themeTab: e);
          }).toList(),
        ),
      ),
    );
  }

  Widget _tabTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(title),
    );
  }
}
