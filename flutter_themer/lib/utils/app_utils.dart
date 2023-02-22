import 'dart:ui';

import 'package:flutter_themer/exports/exports.dart';

bool isDarkMode() =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;

copyToClipboard(String text, {VoidCallback? callback}) async {
  await Clipboard.setData(ClipboardData(text: text));
  callback?.call();
}

showSnackBar(String text) async {
  ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: Theme.of(navKey.currentContext!).textTheme.bodyLarge,
      ),
    ),
  );
}

Future<void> showToast(String text) async {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<void> setWindowSize() async {
  var pixelRatio = window.devicePixelRatio;
  var logicalScreenSize = window.physicalSize / pixelRatio;
  var logicalWidth = logicalScreenSize.width;
  var logicalHeight = logicalScreenSize.height;

  WindowOptions windowOptions = WindowOptions(
    size: Size(logicalWidth, logicalHeight),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

Future<void> setWindow() async {
  if (!kIsWeb) {
    await windowManager.ensureInitialized();
    if (Platform.isMacOS || Platform.isWindows) {
      await setWindowSize();
    }
  }
}
