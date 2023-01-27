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
