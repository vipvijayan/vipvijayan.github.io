import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_themer/utils/exports.dart';
import 'package:flutter_themer/widgets/app_icon.dart';
import 'package:flutter_themer/widgets/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 25),
            const AppIcon(),
            const SizedBox(width: 20),
            Text(
              appTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 30),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Reset',
            onPressed: () async {
              state.reset();
              fbLogEvent(name: 'theme_reset');
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
          IconButton(
            tooltip: 'About',
            onPressed: () async {
              unawaited(openAboutInfoScreen());
              unawaited(fbLogEvent(name: 'about'));
              await FirebaseAnalytics.instance.logEvent(name: 'about');
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: Row(
        children: [
          Loading(loading: state.appLoading),
          if (null != state.curSelectedThemeModel) ...[
            Expanded(
              child: PreviewApp(
                themeData: state.curSelectedThemeModel!.curThemeData!,
              ),
            ),
            const Expanded(
              flex: 2,
              child: ThemeBuilderScreen(),
            ),
          ]
        ],
      ),
    );
  }
}
