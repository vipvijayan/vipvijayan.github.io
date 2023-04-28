import 'package:flutter_themer/utils/exports.dart';

const appTitle = 'Flutter Themer';
const appVersion = 'α';
const themeFileName = 'theme.json';
const appAboutInfoId = 100;

// Version Menu Icon
const versionTitle = 'Version';
const versionIcon = '0xf270';

late PackageInfo packageInfo;
late About about;

// create some values
const propertyWidth = 330.0;
const controlsDimen = 70.0;
const titleFontSize = 14.0;
const defaultPickerColor = Colors.blue;

// images
const previewTitle = 'Preview';
const customColorsTitle = 'Custom Colors';
const getTheme = 'Get Theme';
const codeCopied = 'Code Copied';

var scaffoldKey = GlobalKey<ScaffoldState>();

final random = Random();

enum ThemeIDs {
  primary(0),
  basic(1),
  advanced(2);

  const ThemeIDs(this.value);
  final int value;
}
