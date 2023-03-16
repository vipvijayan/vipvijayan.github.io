import 'package:flutter_themer/utils/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: AppMainTitle(),
        actions: _actionWidgets(context),
      ),
      body: _homeBody(context),
    );
  }

  Widget _homeBody(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Column(
      children: [
        Loading(loading: state.appLoading),
        if (!state.appLoading)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PreviewApp(
                    themeData: state.curSelectedThemeModel.curThemeData!,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: ThemeBuilderScreen(),
                ),
              ],
            ),
          ),
      ],
    );
  }

  List<Widget> _actionWidgets(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    final myColors = Theme.of(context).extension<MyColors>()!;
    return [
      IconButton(
        tooltip: 'Reset',
        onPressed: () async {
          state.curSelectedThemeModel =
              state.themeParentModels[state.initialTabIndex];
          state.tabController.animateTo(state.initialTabIndex);
          state.reset();
          fbLogEvent(name: 'theme_reset');
        },
        icon: Icon(
          Icons.refresh_outlined,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      IconButton(
        tooltip: 'About',
        onPressed: () async {
          unawaited(openAboutInfoScreen());
          unawaited(fbLogEvent(name: 'about'));
          await FirebaseAnalytics.instance.logEvent(name: 'about');
        },
        icon: Icon(
          Icons.info_outline_rounded,
          color: myColors.success,
        ),
      ),
      const SizedBox(width: 20),
    ];
  }
}
