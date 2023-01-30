import 'package:flutter_themer/exports/exports.dart';

class ThemeColor extends StatelessWidget {
  const ThemeColor({
    super.key,
    required this.subItem,
    required this.uiModel,
    required this.onPressed,
  });

  final SubItem subItem;
  final ThemeUiModel uiModel;
  final Function(Color color) onPressed;

  @override
  Widget build(BuildContext context) {
    final currentVal = Preferences.darkTheme
        ? subItem.dark.value.first.value
        : subItem.light.value.first.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subItem.title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 5),
        ColorSelector(
          title: uiModel.title,
          color: HexColor(currentVal),
          propertyKey: currentVal,
          onTap: (Color color) async {
            onPressed(color);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
