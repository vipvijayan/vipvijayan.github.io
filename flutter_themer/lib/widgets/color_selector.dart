import 'package:flutter_themer/exports/exports.dart';

const dimen = 40.0;

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
        padding: EdgeInsets.zero,
        height: dimen,
        width: dimen * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: color,
        ),
      ),
    );
  }
}
