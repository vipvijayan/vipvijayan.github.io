import 'package:flutter_themer/exports/exports.dart';

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
          currentColor: color,
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
            height: controlsDimen,
            width: controlsDimen,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.1),
              borderRadius: BorderRadius.circular(6),
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
