import 'package:flutter_themer/exports/exports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<ThemeAppState>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 25),
            const FaIcon(FontAwesomeIcons.themeisle),
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
              previewAppState.init(refresh: true);
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
              themeData: previewAppState.currentTheme(),
            ),
          ),
          const Expanded(flex: 2, child: ThemeBuilderScreen()),
        ],
      ),
    );
  }
}
