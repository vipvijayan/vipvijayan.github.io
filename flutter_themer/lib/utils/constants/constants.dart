import 'package:flutter_themer/utils/exports.dart';

const appTitle = 'Flutter Themer';
const appVersion = 'α';
const themeFileName = 'theme.json';
const appAboutInfoId = 100;
const appQuickTutorial = 101;
const inputMaxValue = 99999.0;

// Version Menu Icon
const versionTitle = 'Version';
const versionIcon = '0xf270';

late PackageInfo packageInfo;
late About about;

// create some values
const appbarIconSize = 25.0;
const propertyWidth = 250.0;
const controlsDimen = 70.0;
const titleFontSize = 14.0;
const defaultPickerColor = Colors.blue;

// images
const previewTitle = 'Preview';
const customColorsTitle = 'Custom Colors';
const getTheme = 'Get Theme';
const codeCopied = 'Code Copied';
const platformInfo =
    'Experience the Full Splendor of Flutter Themer on Desktops and the Web!';

const logoPath = 'assets/images/favicon.png';

var scaffoldKey = GlobalKey<ScaffoldState>();

final random = Random();

enum ThemeIDs {
  primary(0),
  basic(1),
  advanced(2);

  const ThemeIDs(this.value);
  final int value;
}

final actionBtnShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(16),
  side: BorderSide(color: Colors.grey, width: 0.5),
);
