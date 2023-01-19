import 'package:flutter_themer/exports/exports.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return PreviewAppState();
          },
          lazy: false,
        ),
      ],
      child: AppBuilder(
        builder: (context, themeData) {
          return MaterialApp(
            navigatorKey: navAppPreviewKey,
            debugShowCheckedModeBanner: false,
            showPerformanceOverlay: false,
            theme: themeData,
            darkTheme: themeData,
            home: const PreviewHomeScreen(),
          );
        },
      ),
    );
  }
}
