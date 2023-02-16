import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ThemeBuilderTab(themeTab: state.themeParentModels.first),
    );
  }
}
