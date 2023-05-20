import 'package:flutter_themer/utils/exports.dart';

Future<Map<String, dynamic>> generateColorScheme(Color seedColor) async {
  ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: seedColor);
  Map<String, dynamic> map = {};
  map['color_scheme_seed'] = colorHex(seedColor);
  map['key_cs_background_color'] = colorHex(colorScheme.background);
  map['key_cs_on_background_color'] = colorHex(colorScheme.onBackground);
  map['key_cs_primary'] = colorHex(colorScheme.primary);
  map['key_cs_on_primary'] = colorHex(colorScheme.onPrimary);
  map['key_cs_primary_container'] = colorHex(colorScheme.primaryContainer);
  map['key_cs_on_primary_container'] = colorHex(colorScheme.onPrimaryContainer);
  map['key_cs_secondary'] = colorHex(colorScheme.secondary);
  map['key_cs_on_secondary'] = colorHex(colorScheme.onSecondary);
  map['key_cs_secondary_container'] = colorHex(colorScheme.secondaryContainer);
  map['key_cs_on_secondary_container'] =
      colorHex(colorScheme.onSecondaryContainer);
  map['key_cs_surface'] = colorHex(colorScheme.surface);
  map['key_cs_on_surface'] = colorHex(colorScheme.onSurface);
  map['key_cs_surface_tint'] = colorHex(colorScheme.surfaceTint);
  map['key_cs_surface_variant'] = colorHex(colorScheme.surfaceVariant);
  map['key_cs_on_surface_variant'] = colorHex(colorScheme.onSurfaceVariant);
  map['key_cs_error'] = colorHex(colorScheme.error);
  map['key_cs_on_error'] = colorHex(colorScheme.onError);
  map['key_cs_error_container'] = colorHex(colorScheme.errorContainer);
  map['key_cs_on_error_container'] = colorHex(colorScheme.onErrorContainer);
  map['key_cs_tertiary'] = colorHex(colorScheme.tertiary);
  map['key_cs_on_tertiary'] = colorHex(colorScheme.onTertiary);
  map['key_cs_tertiary_container'] = colorHex(colorScheme.tertiaryContainer);
  map['key_cs_on_tertiary_container'] =
      colorHex(colorScheme.onTertiaryContainer);
  map['key_cs_outline'] = colorHex(colorScheme.outline);
  map['key_cs_shadow'] = colorHex(colorScheme.shadow);
  map['key_cs_inverse_primary'] = colorHex(colorScheme.inversePrimary);
  map['key_cs_inverse_surface'] = colorHex(colorScheme.inverseSurface);
  map['key_cs_on_inverse_surface'] = colorHex(colorScheme.onInverseSurface);
  map['key_cs_outline_variant'] = colorHex(colorScheme.outlineVariant);
  map['key_cs_scrim'] = colorHex(colorScheme.scrim);
  return map;
}

colorHex(Color color) => '#${color.value.toRadixString(16)}';
