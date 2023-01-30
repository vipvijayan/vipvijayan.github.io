import 'package:flutter_themer/exports/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 25),
            const FlutterLogo(),
            const SizedBox(width: 30),
            Text(
              appTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 30),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              previewAppState.setResInputShow(
                !previewAppState.showResolutionInput,
              );
            },
            icon: const Icon(Icons.devices_outlined),
          ),
          IconButton(
            onPressed: () async {
              previewAppState.init(refresh: true);
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
          const VerticalDivider(
            endIndent: 30,
            indent: 30,
            thickness: 0.2,
            width: 40,
          ),
          const ThemeToggler(),
          const VerticalDivider(
            endIndent: 30,
            indent: 30,
            thickness: 0.2,
            width: 40,
          ),
          IconButton(
            onPressed: () async {
              openThemeGeneratedScreen();
              previewAppState.generateHtml();
            },
            icon: const Icon(Icons.start),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appVersion,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
      body: Container(
        color: bgColor,
        child: Row(
          children: [
            const Expanded(flex: 2, child: ThemeBuilderScreen()),
            const SizedBox(width: 30),
            Expanded(
              child: PreviewApp(
                themeData: previewAppState.curThemeData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
