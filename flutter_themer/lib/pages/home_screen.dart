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
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: ThemeBuilderScreen(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 30, 30, 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: PreviewApp(
                        themeData: state.curSelectedThemeModel.curThemeData!,
                      ),
                    ),
                  ),
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
          state.curSelectedThemeIndex = 0;
          state.curSelectedThemeModel =
              state.themeParentModels[state.initialTabIndex];
          state.tabController.animateTo(state.initialTabIndex);
          state.reset();
          unawaited(fbLogEvent(name: 'theme_reset'));
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
