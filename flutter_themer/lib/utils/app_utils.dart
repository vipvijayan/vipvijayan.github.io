import 'package:flutter_themer/exports/exports.dart';

bool isDarkMode() =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;
