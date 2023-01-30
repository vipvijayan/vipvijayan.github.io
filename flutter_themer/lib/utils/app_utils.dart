import 'package:flutter_themer/exports/exports.dart';

bool isDarkMode() =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;

copyToClipboard(String text, {VoidCallback? callback}) async {
  await Clipboard.setData(ClipboardData(text: text));
  callback?.call();
}

showToast(String text) async {
  ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: Theme.of(navKey.currentContext!).textTheme.bodyLarge,
      ),
    ),
  );
}

setWindowSize() async {
  if (Platform.isMacOS || Platform.isWindows) {
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1600, 1300),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
