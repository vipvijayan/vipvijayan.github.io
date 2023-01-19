import 'package:flutter_themer/exports/exports.dart';

const dimen = 25.0;

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.color,
    required this.propertyKey,
    required this.onTap,
  });

  final Color color;
  final String propertyKey;
  final Function(Color color) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showColorDialog(
          context,
          propertyKey: propertyKey,
          onTap: (color) {
            onTap(color);
          },
        );
      },
      child: Container(
        height: dimen,
        width: dimen,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dimen / 2),
          color: color,
        ),
      ),
    );
  }
}