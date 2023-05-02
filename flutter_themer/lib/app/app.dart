import 'package:flutter_themer/utils/exports.dart';

void setErrorBuilder() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return Scaffold(
      body: Center(
        child: Text("Unexpected error. See console for details."),
      ),
    );
  };
}

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
        navigatorKey: mainNavKey,
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
