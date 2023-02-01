import 'package:flutter_themer/exports/exports.dart';

const dimen = 50.0;

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String title;
  final Color color;
  final Function(Color color) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showColorDialog(
          context,
          title: title,
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
            width: dimen,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimen / 2),
              color: color,
            ),
          ),
          // IconButton(
          //   iconSize: 14,
          //   padding: EdgeInsets.zero,
          //   onPressed: () async {
          //     copyToClipboard(
          //       colorToHex(color),
          //       callback: () {
          //         showToast('$title color copied');
          //       },
          //     );
          //   },
          //   icon: const Icon(Icons.copy_outlined),
          // )
        ],
      ),
    );
  }
}
