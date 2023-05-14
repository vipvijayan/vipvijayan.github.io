import 'dart:ui';
import 'package:flutter_themer/utils/exports.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

bool isDarkMode() =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;

Future<void> handleInput({
  required String? inputVal,
  required SubItem subItem,
  required bool dark,
  required ThemeAppState state,
}) async {
  try {
    if (inputVal == null || inputVal.trim().isEmpty) {
      inputVal = '0';
    }
    if (inputVal.trim().endsWith('.')) {
      logE('Invalid Input');
      return;
    }
    logD(inputVal);
    final value = double.parse(inputVal);
    if (value > inputMaxValue) {
      showSnackBar('Value greater than $inputMaxValue not allowed');
      return;
    }
    hideSnackBar();
    if (dark) {
      subItem.dark.value.first.value = inputVal;
    } else {
      subItem.light.value.first.value = inputVal;
    }
    state.refreshPreview();
  } catch (e) {
    logE(e.toString());
  }
}

Future<void> copyToClipboard(String? text, {VoidCallback? callback}) async {
  if (null == text) {
    return;
  }
  await Clipboard.setData(ClipboardData(text: text));
  callback?.call();
}

Future<void> showSnackBar(String text) async {
  ScaffoldMessenger.of(mainNavKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: Theme.of(mainNavKey.currentContext!).textTheme.bodyLarge,
      ),
    ),
  );
}

Future<void> hideSnackBar() async {
  ScaffoldMessenger.of(mainNavKey.currentContext!).hideCurrentSnackBar();
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

isDesktopOrWeb() {}

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

materialIcon(String iconHex) =>
    IconData(int.parse(iconHex), fontFamily: 'MaterialIcons');

TextStyle? subtitleStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge?.copyWith(
        fontSize: titleFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      );
}

Future<void> showUpdatesModalBottomSheet(String updatesHtml) async {
  showModalBottomSheet<void>(
    context: mainNavKey.currentContext!,
    builder: (context) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: HtmlWidget(updatesHtml),
      );
    },
  );
}

Future<void> openUrl(String? url) async {
  if (url == null || url.isEmpty) {
    logD('No Url to Open');
    return;
  }
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Future<void> initFB() async {
  await analytics.logAppOpen();
  await analytics.setAnalyticsCollectionEnabled(true);
}

Future<void> initAboutInfo() async {
  packageInfo = await PackageInfo.fromPlatform();
  about = await loadAboutInfo();
  about.items.add(versionMenuItem());
}

versionMenuItem() {
  return AboutItem(
    id: 99,
    title: versionTitle,
    subtitle: '${packageInfo.version} (${packageInfo.buildNumber})',
    icon: versionIcon,
    copyEnabled: false,
    tooltipMessage: 'App Version Info',
  );
}
