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
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.dark().copyWith(background: Colors.black),
          appBarTheme: AppBarTheme(
            elevation: 0,
            toolbarHeight: kToolbarHeight + 10,
          ),
          extensions: <ThemeExtension<dynamic>>[
            MyColors.dark,
          ],
        ),
        themeMode: ThemeMode.system,
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.light().copyWith(background: Colors.white),
          appBarTheme: AppBarTheme(
            elevation: 0,
            toolbarHeight: kToolbarHeight + 10,
          ),
          extensions: <ThemeExtension<dynamic>>[
            MyColors.light,
          ],
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
