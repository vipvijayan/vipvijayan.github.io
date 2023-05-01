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
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return DefaultTabController(
      length: state.themeParentModels.length,
      child: Scaffold(
        appBar: TabBar(
          controller: state.tabController,
          onTap: (index) async {
            if (state.curSelectedThemeIndex == index) {
              return;
            }
            state.previewLoading = true;
            state.curSelectedThemeIndex = index;
            state.tabController.animateTo(index);
            state.curSelectedThemeModel = state.themeParentModels[index];
            unawaited(state.refresh());
            state.previewLoading = false;
            unawaited(fbLogEvent(
                name: 'Selected: ${state.curSelectedThemeModel.title}'));
          },
          tabs: state.themeParentModels
              .map((e) => _tabTitle(e.title.toUpperCase()))
              .toList(),
        ),
        body: TabBarView(
          controller: state.tabController,
          physics: const BouncingScrollPhysics(),
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
