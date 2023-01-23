import 'package:flutter_themer/exports/exports.dart';

class ThemeCustomColorsUI extends StatelessWidget {
  //
  const ThemeCustomColorsUI({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    return Column(
      children: previewAppState.customColors.map(
        (customColor) {
          return Container(
            padding: const EdgeInsets.fromLTRB(40, 5, 20, 0),
            child: Row(
              children: [
                Expanded(child: TextFormField()),
                const SizedBox(width: 30),
                Expanded(
                  child: ColorSelector(
                    color: HexColor('#FFFFFFFF'),
                    propertyKey: '1',
                    onTap: (Color color) {
                      //
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
