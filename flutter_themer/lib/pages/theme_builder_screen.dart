import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/widgets/color_selector.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ParentContainer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const MainTitle(title: 'Scaffold'),
                  _row(
                    context,
                    'Background Color:',
                    'scaffold_background_color',
                  ),
                  const Divider(),
                  const SubTitle(title: 'Elevation'),
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (elevation) async {
                      if (elevation.isEmpty) {
                        elevation = '0.0';
                      }
                      final state = context.read<PreviewAppState>();
                      state.addToTheme(
                        'app_bar_elevation',
                        double.parse(elevation),
                      );
                      state.setPreviewTheme();
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const MainTitle(title: 'AppBar'),
                  _row(
                    context,
                    'AppBar Background Color:',
                    'app_bar_background_color',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _row(BuildContext context, String title, String key) {
    final value = context.watch<PreviewAppState>().customTheme[key];
    logD('Key: $key, value: $value');
    if (null == value) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        SubTitle(title: title),
        const SizedBox(width: 10),
        ColorSelector(
          color: HexColor(value),
          propertyKey: key,
          onTap: (Color color) {
            final state = context.read<PreviewAppState>();
            state.addToTheme(key, colorHex(color));
            state.setPreviewTheme();
          },
        ),
      ],
    );
  }
}
