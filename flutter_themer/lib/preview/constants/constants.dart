import 'package:flutter_themer/exports/exports.dart';

const themeFileName = 'theme.json';

late PackageInfo packageInfo;
late About about;

// create some values
const propertyWidth = 240.0;
const controlsDimen = 60.0;
const titleFontSize = 14.0;
const defaultPickerColor = Colors.blue;
const supportEmail = 'flutterthemer@gmail.com';
const githubUrl = 'https://github.com/flutterthemer/flutterthemer.github.io';

// images
const previewTitle = 'Preview';
const customColorsTitle = 'Custom Colors';
const getTheme = 'Get Theme';

var scaffoldKey = GlobalKey<ScaffoldState>();

final random = Random();

enum ThemeIDs {
  primary(0),
  basic(1),
  advanced(2);

  const ThemeIDs(this.value);
  final int value;
}
