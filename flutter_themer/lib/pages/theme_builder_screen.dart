import 'package:flutter_themer/utils/exports.dart';

class ThemeBuilderScreen extends StatefulWidget {
  const ThemeBuilderScreen({super.key});

  @override
  State<ThemeBuilderScreen> createState() => _ThemeBuilderScreenState();
}

class _ThemeBuilderScreenState extends State<ThemeBuilderScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final state = context.read<ThemeAppState>();
    state.tabController = TabController(
      length: state.themeParentModels.length,
      vsync: this,
      initialIndex: state.initialTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return DefaultTabController(
      length: state.themeParentModels.length,
      child: Scaffold(
        appBar: TabBar(
          onTap: (index) async {
            if (state.curSelectedThemeIndex == index) {
              logD('No Tab Refresh');
              return;
            }
            state.curSelectedThemeIndex = index;
            state.curSelectedThemeModel = state.themeParentModels[index];
            state.tabController.animateTo(index);
            state.refresh();
            fbLogEvent(name: 'Selected: ${state.curSelectedThemeModel.title}');
          },
          tabs: state.themeParentModels
              .map((e) => _tabTitle(e.title.toUpperCase()))
              .toList(),
        ),
        body: TabBarView(
          controller: state.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: state.themeParentModels
              .map((e) => ThemeBuilderTab(themeTab: e))
              .toList(),
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

  @override
  void dispose() {
    final state = context.read<ThemeAppState>();
    state.tabController.dispose();
    super.dispose();
  }
}
