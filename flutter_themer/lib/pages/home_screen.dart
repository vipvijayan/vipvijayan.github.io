import 'package:flutter_themer/utils/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const AppMainTitle(),
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
                _previewFragment(state),
                _themeBuilderFragment(state),
                if (state.settingsOpen) Expanded(child: AboutInfoScreen()),
              ],
            ),
          ),
      ],
    );
  }

  Widget _themeBuilderFragment(ThemeAppState state) {
    return Expanded(
      flex: state.settingsOpen ? 2 : 3,
      child: const Padding(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: ThemeBuilderScreen(),
      ),
    );
  }

  Widget _previewFragment(ThemeAppState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: PreviewApp(
                themeData: state.curSelectedThemeModel.curThemeData!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _actionWidgets(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    final myColors = Theme.of(context).extension<MyColors>()!;
    return [
      const ExportTheme(),
      const SizedBox(width: 20),
      IconButton(
        iconSize: appbarIconSize,
        tooltip: 'Reset',
        onPressed: () async {
          unawaited(state.reset());
          unawaited(fbLogEvent(name: 'theme_reset'));
        },
        icon: Icon(
          Icons.refresh_outlined,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      const SizedBox(width: 20),
      IconButton(
        iconSize: appbarIconSize,
        tooltip: 'Show/Hide Preview Settings',
        icon: const Icon(Icons.settings),
        onPressed: () async {
          unawaited(state.togglePreviewSettings());
          unawaited(fbLogEvent(name: 'preview_settings'));
        },
      ),
      const SizedBox(width: 20),
      IconButton(
        tooltip: 'About',
        iconSize: appbarIconSize,
        onPressed: () async {
          unawaited(state.openSettings());
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
