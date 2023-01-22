import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/pages/splash_screen.dart';
import 'package:flutter_themer/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final state = PreviewAppState();
            state.init();
            return state;
          },
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeAppState(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: showDebugBanner,
        showPerformanceOverlay: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
