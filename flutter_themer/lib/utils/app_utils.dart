import 'dart:ui';

import 'package:flutter_themer/utils/exports.dart';

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

String colorHex(Color color) => '#${color.value.toRadixString(16)}';

Future<void> showColorDialog(
  BuildContext context, {
  required String title,
  Color currentColor = defaultPickerColor,
  required Function(Color color) onTap,
}) async {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey,
        titlePadding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.all(30),
        elevation: 0,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(6)),
            pickerColor: currentColor,
            enableAlpha: true,
            pickerAreaHeightPercent: 0.6,
            labelTypes: const [ColorLabelType.hsl, ColorLabelType.hsv],
            paletteType: PaletteType.hsl,
            displayThumbColor: true,
            onColorChanged: ((color) {
              onTap(color);
            }),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'DONE',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
