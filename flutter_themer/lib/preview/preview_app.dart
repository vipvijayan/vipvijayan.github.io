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
    // return DeviceFrame(
    //   device: Devices.ios.iPhone12,
    //   isFrameVisible: true,
    //   orientation: Orientation.portrait,

    //   screen: MaterialApp(
    //     useInheritedMediaQuery: true,
    //     locale: DevicePreview.locale(context),
    //     builder: DevicePreview.appBuilder,
    //     navigatorKey: navAppPreviewKey,
    //     debugShowCheckedModeBanner: false,
    //     showPerformanceOverlay: false,
    //     theme: themeData,
    //     home: const PreviewHomeScreen(),
    //   ),
    // );
    return DevicePreview(
      backgroundColor: Theme.of(context).colorScheme.surface,
      defaultDevice: Devices.ios.iPhone13ProMax,
      isToolbarVisible: state.showPreviewToolbar,
      data: const DevicePreviewData(
        highContrast: false,
        isFrameVisible: true,
        isDarkMode: false,
        boldText: false,
        settings: DevicePreviewSettingsData(
          // toolbarTheme: DevicePreviewToolBarThemeData.light,
          toolbarPosition: DevicePreviewToolBarPositionData.bottom,
          // backgroundTheme: DevicePreviewBackgroundThemeData.light,
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
