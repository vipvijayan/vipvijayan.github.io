import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/widgets/app_icon.dart';

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
            Expanded(
              child: Text(
                appTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
              state.init(refresh: true);
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appVersion,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: PreviewApp(
              themeData: state
                  .themeParentModels[state.currentThemeTabIndex].curThemeData!,
            ),
          ),
          const Expanded(flex: 2, child: ThemeBuilderScreen()),
        ],
      ),
    );
  }
}
