import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/pages/splash_screen.dart';

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
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: showDebugBanner,
        showPerformanceOverlay: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const SplashScreen(),
      ),
    );
  }
}
