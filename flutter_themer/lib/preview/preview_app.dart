import 'package:flutter_themer/exports/exports.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({
    super.key,
    required this.themeData,
  });
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navAppPreviewKey,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: themeData,
      darkTheme: themeData,
      home: const PreviewHomeScreen(),
    );
  }
}
