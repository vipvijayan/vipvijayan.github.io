import 'package:flutter_themer/utils/exports.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({
    super.key,
    required this.themeData,
  });
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return DevicePreview(
      backgroundColor: Colors.white,
      isToolbarVisible: state.showPreviewToolbar,
      data: const DevicePreviewData(
        isDarkMode: false,
        boldText: false,
        settings: DevicePreviewSettingsData(
          toolbarTheme: DevicePreviewToolBarThemeData.light,
          toolbarPosition: DevicePreviewToolBarPositionData.bottom,
          backgroundTheme: DevicePreviewBackgroundThemeData.light,
        ),
      ),
      builder: (context) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          navigatorKey: navAppPreviewKey,
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          theme: themeData,
          home: const PreviewHomeScreen(),
        );
      },
    );
  }
}
