import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: showDebugBanner,
      navigatorKey: navKey,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
