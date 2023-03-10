import 'package:flutter_themer/exports/exports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeAppState(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: appTitle,
        navigatorKey: navKey,
        navigatorObservers: <NavigatorObserver>[observer],
        debugShowCheckedModeBanner: showDebugBanner,
        showPerformanceOverlay: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
