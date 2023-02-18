import 'package:flutter_themer/exports/exports.dart';

const themeFileName = 'theme.json';

// create some values
const defaultPickerColor = Colors.blue;

// images
const previewTitle = 'Preview';
const customColorsTitle = 'Custom Colors';

var scaffoldKey = GlobalKey<ScaffoldState>();

final random = Random();

const controlsDimen = 60.0;

enum ThemeIDs {
  basic(0),
  advanced(1);

  const ThemeIDs(this.value);
  final int value;
}
