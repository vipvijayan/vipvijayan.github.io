import 'package:flutter_themer/exports/exports.dart';

class ThemeCustomColorsUI extends StatelessWidget {
  //
  const ThemeCustomColorsUI({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    final dark = isDarkBrightness(previewAppState.curSelectedThemeModel);
    return Column(
      children: previewAppState.customColors.map(
        (customColor) {
          final curColor = HexColor(dark
              ? customColor.darkModeColorCode
              : customColor.lightModeColorCode);
          return Container(
            padding: const EdgeInsets.fromLTRB(40, 5, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Color Name (max 20 Chars)',
                    ),
                    onChanged: (value) {
                      if (value.length > 20) {
                        return;
                      }
                      customColor.name = value;
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ColorSelector(
                    title: 'Custom Color ${customColor.name}',
                    color: curColor,
                    onTap: (Color color) {
                      if (dark) {
                        customColor.darkModeColorCode = colorHex(color);
                        return;
                      }
                      customColor.lightModeColorCode = colorHex(color);
                      previewAppState.refresh();
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    previewAppState.removeFromCustomColorsList(customColor.id);
                    previewAppState.refresh();
                  },
                  icon: const Icon(Icons.delete_outline),
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
