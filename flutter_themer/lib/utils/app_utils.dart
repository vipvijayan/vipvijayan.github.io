import 'package:flutter_themer/exports/exports.dart';

bool isDarkMode() =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;

copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
