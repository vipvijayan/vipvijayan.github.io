import 'package:flutter_themer/exports/exports.dart';

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
      radius: 6,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: expanded ? Colors.teal : Colors.grey[200],
                border: Border.all(
                  color: Colors.grey[200]!,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: MainTitle(
                title: title,
                fontSize: 18,
                txtColor: expanded ? Colors.teal : Colors.black,
              ),
            ),
            Icon(
              expanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
