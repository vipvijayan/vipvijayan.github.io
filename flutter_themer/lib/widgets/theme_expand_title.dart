import 'package:flutter_themer/utils/exports.dart';

class ExpandTitle extends StatelessWidget {
  const ExpandTitle({
    super.key,
    required this.title,
    required this.expanded,
    required this.onPressed,
  });

  final String title;
  final bool expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 3,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      onTap: onPressed,
      child: Container(
        color: expanded ? Colors.grey.shade100 : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // BulletIcon(expanded: expanded),
            const SizedBox(width: 15),
            Expanded(
              child: MainTitle(
                title: title,
                fontSize: titleFontSize + (expanded ? 4 : 2),
                txtColor: expanded ? Colors.blue : Colors.black,
              ),
            ),
            Icon(
              expanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: expanded ? Colors.blue : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
