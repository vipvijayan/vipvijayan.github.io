import 'package:device_preview/device_preview.dart';
import 'package:flutter_themer/utils/exports.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({
    super.key,
    required this.themeData,
  });
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // data: const DevicePreviewData(
      //   settings: DevicePreviewSettingsData(
      //     backgroundTheme: DevicePreviewBackgroundThemeData.light,
      //     toolbarTheme: DevicePreviewToolBarThemeData.light,
      //     toolbarPosition: DevicePreviewToolBarPositionData.top,
      //   ),
      // ),
      builder: (context) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          navigatorKey: navAppPreviewKey,
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          theme: themeData,
          // darkTheme: themeData,
          home: const PreviewHomeScreen(),
        );
      },
    );
  }
}
