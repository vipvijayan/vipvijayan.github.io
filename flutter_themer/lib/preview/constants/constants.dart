import 'dart:math';

import 'package:flutter_themer/exports/exports.dart';

const themeFileName = 'theme.json';

// create some values
Color pickerColor = const Color(0xff443a49);
Color currentColor = const Color(0xff443a49);

// images
const iphoneBg = 'assets/images/iphone_14_1.png';
const previewTitle = 'Preview';
const customColorsTitle = 'Custom Colors';

var scaffoldKey = GlobalKey<ScaffoldState>();

final random = Random();
