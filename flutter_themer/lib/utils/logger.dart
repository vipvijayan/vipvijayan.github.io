import 'package:flutter_themer/utils/exports.dart';
import 'package:logger/logger.dart';

var logger = Logger();

logD(String message) {
  if (kDebugMode) logger.d(message);
}

logE(String message) {
  if (kDebugMode) logger.e(message);
}
