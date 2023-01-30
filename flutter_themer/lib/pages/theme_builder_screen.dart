import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/pages/theme_builder_tab.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return Material(
      type: MaterialType.transparency,
      child: DefaultTabController(
        length: state.themeTabs.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Theme'),
            bottom: TabBar(
              tabs: state.themeTabs
                  .map((e) => Tab(text: e.title.toUpperCase()))
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: state.themeTabs
                .map((e) => ThemeBuilderTab(themeTab: e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
