// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_themer/utils/exports.dart';

class ThemeFileUtils {
  static Map<String, dynamic> getThemeMap(ThemeParentModel themeParentModel) {
    final map = <String, dynamic>{};
    final dark = isDarkBrightness(themeParentModel);
    for (final themeUIModel in themeParentModel.themeUiModelList) {
      final items = themeUIModel.items;
      for (final item in items) {
        final subItems = item.subItems;
        for (final subItem in subItems) {
          if (subItem.input == 'color') {
            map[subItem.key] = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'number') {
            map[subItem.key] = dark
                ? double.parse(subItem.dark.value.first.value)
                    .toStringAsFixed(1)
                : double.parse(subItem.light.value.first.value)
                    .toStringAsFixed(1);
          }
          if (subItem.input == 'boolean') {
            map[subItem.key] = (dark
                    ? subItem.dark.value.first.value
                    : subItem.light.value.first.value)
                .parseBool();
          }
          if (subItem.input == 'dropdown') {
            final list = dark ? subItem.dark.value : subItem.light.value;
            map[subItem.key] =
                list.firstWhere((element) => element.selected).value;
          }
        }
      }
    }
    return map;
  }

  static Future<String> generateThemeTxt(
    List<ThemeUiModel> themeUIModelList,
    bool hasCustomColors, {
    required int themeId,
    required bool dark,
  }) async {
    var themeHtml = await loadThemeTxt(themeId);
    for (final themeUIModel in themeUIModelList) {
      final items = themeUIModel.items;
      for (final item in items) {
        final subItems = item.subItems;
        for (final subItem in subItems) {
          var val = '';
          if (subItem.input == 'color') {
            val = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
            val = "Color(0x$val)";
          }
          if (subItem.input == 'number') {
            val = dark
                ? double.parse(subItem.dark.value.first.value)
                    .toStringAsFixed(1)
                : double.parse(subItem.light.value.first.value)
                    .toStringAsFixed(1);
          }
          if (subItem.input == 'boolean') {
            val = dark
                ? subItem.dark.value.first.value
                : subItem.light.value.first.value;
          }
          if (subItem.input == 'dropdown') {
            final list = dark ? subItem.dark.value : subItem.light.value;
            val = list.firstWhere((element) => element.selected).value;
          }
          themeHtml = themeHtml.replaceAll(
            "'${subItem.key}'",
            val.replaceAll('#', ''),
          );
        }
        themeHtml = themeHtml.replaceAll(
          "'key_cs_brightness'",
          brightnessString(!dark),
        );
        if (dark) {
          themeHtml = themeHtml.replaceAll(
            "ColorScheme.light",
            "ColorScheme.dark",
          );
        }
      }
    }
    if (hasCustomColors) {
      if (dark) {
        themeHtml = themeHtml.replaceAll(
          "'extensions'",
          "extensions: <ThemeExtension<dynamic>>[ \n     MyColors.dark, \n    ],",
        );
      } else {
        themeHtml = themeHtml.replaceAll(
          "'extensions'",
          "extensions: <ThemeExtension<dynamic>>[  \n     MyColors.light, \n    ],",
        );
      }
    } else {
      themeHtml = themeHtml.replaceAll(
        "'extensions'",
        "",
      );
    }
    return themeHtml;
  }

  static Future<String> generateCustomThemeTxt(
    List<CustomColor> customColors,
  ) async {
    final length = customColors.length;
    if (0 == length) {
      return '';
    }
    var themeHtml = await loadCustomColorsTxt();
    final newLine = length == 1 ? '' : '\n';
    var str999 = '';
    var str888 = '';
    var str777 = '';
    var str666 = '';
    var str555 = '';
    var str444 = '';
    var str333 = '';
    int counter = 0;
    for (final cColor in customColors) {
      if (cColor.name.trim().isEmpty) continue;
      final space = counter == 0 ? '' : '  ';
      str999 += '$space this.${cColor.name},$newLine';
      str888 += '$space final Color? ${cColor.name};$newLine';
      str777 += '$space Color? ${cColor.name},$newLine';
      str666 +=
          '$space ${cColor.name}: ${cColor.name} ?? this.${cColor.name},$newLine';
      counter++;
      str555 +=
          '$space ${cColor.name}: Color.lerp(${cColor.name}, other.${cColor.name},t),$newLine';
      str444 +=
          "$space ${cColor.name}: Color(0x${cColor.lightModeColorCode.replaceAll('#', '')}),$newLine";
      str333 +=
          "$space ${cColor.name}: Color(0x${cColor.darkModeColorCode.replaceAll('#', '')}),$newLine";
    }
    themeHtml = themeHtml.replaceAll('9999999999', str999);
    themeHtml = themeHtml.replaceAll('8888888888', str888);
    themeHtml = themeHtml.replaceAll('7777777777', str777);
    themeHtml = themeHtml.replaceAll('6666666666', str666);
    themeHtml = themeHtml.replaceAll('5555555555', str555);
    themeHtml = themeHtml.replaceAll('4444444444', str444);
    themeHtml = themeHtml.replaceAll('3333333333', str333);
    return themeHtml;
  }
}

Alignment textButtonAlignment(String alignment) {
  switch (alignment) {
    case 'Alignment.topLeft':
      return Alignment.topLeft;
    case 'Alignment.topCenter':
      return Alignment.topCenter;
    case 'Alignment.topRight':
      return Alignment.topRight;
    case 'Alignment.bottomLeft':
      return Alignment.bottomLeft;
    case 'Alignment.bottomCenter':
      return Alignment.bottomCenter;
    case 'Alignment.bottomRight':
      return Alignment.bottomRight;
    case 'Alignment.centerLeft':
      return Alignment.centerLeft;
    case 'Alignment.centerRight':
      return Alignment.centerRight;
    default:
      return Alignment.center;
  }
}

BorderStyle tabBarIndicatorUnderlineBorderStyle(String borderStyle) {
  switch (borderStyle) {
    case 'BorderStyle.solid':
      return BorderStyle.solid;
    default:
      return BorderStyle.none;
  }
}

SystemUiOverlayStyle systemOverlayStyle(String style) {
  switch (style) {
    case 'dark':
      return SystemUiOverlayStyle.dark;
    default:
      return SystemUiOverlayStyle.light;
  }
}

FloatingLabelAlignment inputDecFloatingLabelAlignment(String style) {
  switch (style) {
    case 'center':
      return FloatingLabelAlignment.center;
    default:
      return FloatingLabelAlignment.start;
  }
}

FloatingLabelBehavior inputDecFloatingLabelBehavior(String style) {
  switch (style) {
    case 'always':
      return FloatingLabelBehavior.always;
    case 'never':
      return FloatingLabelBehavior.never;
    default:
      return FloatingLabelBehavior.auto;
  }
}

TabBarIndicatorSize tabIndicatorSize(String size) {
  switch (size) {
    case 'TabBarIndicatorSize.label':
      return TabBarIndicatorSize.label;
    default:
      return TabBarIndicatorSize.tab;
  }
}

PageTransitionsBuilder pageTransitionTheme(String transition) {
  switch (transition) {
    case 'FadeUpwardsPageTransitionsBuilder()':
      return const FadeUpwardsPageTransitionsBuilder();
    case 'OpenUpwardsPageTransitionsBuilder()':
      return const OpenUpwardsPageTransitionsBuilder();
    case 'ZoomPageTransitionsBuilder()':
      return const ZoomPageTransitionsBuilder();
    default:
      return const CupertinoPageTransitionsBuilder();
  }
}

VisualDensity getVisualDensity(String density) {
  switch (density) {
    case 'VisualDensity.comfortable':
      return VisualDensity.comfortable;
    case 'VisualDensity.compact':
      return VisualDensity.compact;
    case 'VisualDensity.adaptivePlatformDensity':
      return VisualDensity.adaptivePlatformDensity;
    default:
      return VisualDensity.standard;
  }
}

String brightnessString(bool bright) =>
    bright ? 'Brightness.light' : 'Brightness.dark';

Brightness brightness(bool bright) =>
    bright ? Brightness.light : Brightness.dark;

bool isDarkBrightness(ThemeParentModel? curSelectedThemeModel) {
  if (null == curSelectedThemeModel) {
    return false;
  }
  return curSelectedThemeModel.brightness == Brightness.dark;
}
