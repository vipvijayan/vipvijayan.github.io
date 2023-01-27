import 'package:flutter_themer/exports/exports.dart';

const dimen = 45.0;

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.title,
    required this.color,
    required this.propertyKey,
    required this.onTap,
  });

  final String title;
  final Color color;
  final String propertyKey;
  final Function(Color color) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showColorDialog(
          context,
          title: title,
          propertyKey: propertyKey,
          onTap: (color) {
            onTap(color);
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: dimen,
            width: dimen * 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: color,
            ),
          ),
          IconButton(
            iconSize: 14,
            padding: EdgeInsets.zero,
            onPressed: () async {
              //
            },
            icon: const Icon(Icons.copy_outlined),
          )
        ],
      ),
    );
  }
}
