import 'package:flutter_themer/state/theme_changer.dart';
import 'package:flutter_themer/utils/exports.dart';
import 'package:flutter_themer/widgets/platform_info_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Scaffold(
      key: state.homeScaffoldKey,
      onEndDrawerChanged: (isOpened) async {
        state.appInfoOpen = isOpened;
      },
      endDrawer: Drawer(
        width: MediaQuery.sizeOf(context).width / 3,
        child: AboutInfoScreen(),
      ),
      appBar: AppBar(
        title: const AppMainTitle(),
        toolbarHeight: kToolbarHeight + 30,
        actions: _actionWidgets(context, state),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const PlatFormInfoBanner(),
            Loading(loading: state.appLoading),
            if (!state.appLoading) ...[
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: PreviewApp(
                        themeData: state.curSelectedThemeModel.curThemeData!,
                      ),
                    ),
                    Expanded(flex: 2, child: ThemeBuilderScreen()),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _actionWidgets(BuildContext context, ThemeAppState state) {
    final myColors = Theme.of(context).extension<MyColors>()!;
    return [
      ActionChip(
        label: const Text('Generate theme'),
        shape: actionBtnShape,
        avatar: Icon(
          Icons.color_lens,
          color: myColors.success,
        ),
        onPressed: () async {
          openThemeGeneratedScreen();
          state.generateHtml();
        },
      ),
      const SizedBox(width: 20),
      ActionChip(
        label: const Text('Reset'),
        shape: actionBtnShape,
        avatar: Icon(
          Icons.refresh_outlined,
          color: Theme.of(context).colorScheme.error,
        ),
        onPressed: () async {
          unawaited(state.reset());
          unawaited(fbLogEvent(name: 'theme_reset'));
        },
      ),
      const SizedBox(width: 20),
      ActionChip(
        label: const Text('Preview settings'),
        shape: actionBtnShape,
        avatar: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () async {
          unawaited(state.togglePreviewSettings());
          unawaited(fbLogEvent(name: 'preview_settings'));
        },
      ),
      const SizedBox(width: 20),
      ActionChip(
        label: const Text('Switch app theme'),
        shape: actionBtnShape,
        avatar: Icon(
          Icons.brightness_2,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () async {
          appLightTheme = !appLightTheme;
          AppBuilder.of(context)?.rebuild();
          unawaited(fbLogEvent(name: 'app_theme'));
        },
      ),
      const SizedBox(width: 20),
      ActionChip(
        label: const Text('About'),
        shape: actionBtnShape,
        avatar: Icon(
          Icons.info_outline_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () async {
          if (state.appInfoOpen) {
            await state.closeSettingsDrawer();
          } else {
            await state.openSettingsDrawer();
          }
          unawaited(fbLogEvent(name: 'about'));
        },
      ),
      const SizedBox(width: 20),
    ];
  }
}
