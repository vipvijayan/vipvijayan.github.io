import 'package:flutter_themer/exports/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Row(
        children: [
          const Expanded(child: ThemeBuilderScreen()),
          Expanded(
            child: PreviewApp(
              themeData: previewAppState.curThemeData,
            ),
          ),
        ],
      ),
    );
  }
}
