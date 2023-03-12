import 'package:flutter_themer/exports/exports.dart';

class ThemeColor extends StatelessWidget {
  const ThemeColor({
    super.key,
    required this.subItem,
    required this.uiModel,
    required this.currentColor,
    required this.onPressed,
  });

  final SubItem subItem;
  final String currentColor;
  final ThemeUiModel uiModel;
  final Function(Color color) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorSelector(
          title: '${uiModel.title} - ${subItem.title}',
          color: HexColor(currentColor),
          onTap: (Color color) async {
            onPressed(color);
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subItem.title,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: titleFontSize - 2,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '#${colorToHex(HexColor(currentColor))}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
