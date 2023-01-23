import 'package:flutter_themer/exports/exports.dart';

const dimen = 45.0;

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

// Text(
              //   colorHex(color).toUpperCase(),
              //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //         color: Colors.grey[300],
              //         fontWeight: FontWeight.w100,
              //         fontSize: 14,
              //       ),
              // ),